# get all subnets from the VPC
# this is used when creating ELBs and ASGs
data "aws_subnet_ids" "all_subnets" {
  vpc_id = "${var.aws_vpc_id}"

  tags {
    # todo: remove this filter needed for Mapzen Search
    Name = "NonProd"
  }
}

resource "aws_ecs_cluster" "pelias" {
  name = "${var.service_name}-${var.environment}"
}

resource "aws_autoscaling_group" "ecs" {
  name                 = "${var.service_name}-${var.environment}-ecs"
  launch_configuration = "${aws_launch_configuration.ecs.name}"

  vpc_zone_identifier = ["${data.aws_subnet_ids.all_subnets.ids}"]

  lifecycle {
    create_before_destroy = true
  }

  min_size = 1
  max_size = 1

  tag {
    key                 = "Name"
    value               = "${var.service_name}-${var.environment}-ecs"
    propagate_at_launch = true
  }

  tag {
    key                 = "team"
    value               = "search"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "ecs" {
  name_prefix = "${var.service_name}-${var.environment}-ecs"

  user_data = <<EOF
  #!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.pelias.name} > /etc/ecs/ecs.config
EOF

  image_id                    = "ami-ec33cc96"                                                # lastest AWS ECS optimized image for us-east
  instance_type               = "t2.micro"
  iam_instance_profile        = "${aws_iam_instance_profile.elasticsearch-health-logger.arn}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "elasticsearch-health-logger-containers" {
  template = "${file("${path.module}/files/containers.json")}"

  vars {
    log_group          = "${aws_cloudwatch_log_group.elasticsearch-index-health.name}"
    elasticsearch_host = "${var.elasticsearch_host}"
  }
}

resource "aws_ecs_task_definition" "elasticsearch-health-logger" {
  family = "${var.service_name}-${var.environment}-elasticsearch-health-logger"

  container_definitions = "${data.template_file.elasticsearch-health-logger-containers.rendered}"
}

resource "aws_ecs_service" "elasticsearch-health-logger-service" {
  name = "elasticsearch-health-logger-service"

  task_definition = "${aws_ecs_task_definition.elasticsearch-health-logger.id}"
  cluster         = "${aws_ecs_cluster.pelias.id}"
  desired_count   = 1
}
