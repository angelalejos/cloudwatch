resource "aws_iam_role" "elasticsearch-health-logger" {
  name               = "${var.service_name}-${var.environment}-elasticsearch-health-logger"
  assume_role_policy = "${file("${path.module}/files/role.json")}"
}

resource "aws_iam_role_policy" "write-cloudwatch" {
  name   = "${var.service_name}-${var.environment}-write-cloudwatch-policy"
  policy = "${file("${path.module}/files/write-cloudwatch-logs.json")}"
  role   = "${aws_iam_role.elasticsearch-health-logger.id}"
}

resource "aws_iam_role_policy" "register-ecs" {
  name   = "${var.service_name}-${var.environment}-register-ecs-policy"
  policy = "${file("${path.module}/files/ecs_policy.json")}"
  role   = "${aws_iam_role.elasticsearch-health-logger.id}"
}

resource "aws_iam_role_policy" "elasticsearch-health-logger" {
  name   = "${var.service_name}-${var.environment}-elasticsearch-health-logger-policy"
  policy = "${file("${path.module}/files/write-cloudwatch-logs.json")}"
  role   = "${aws_iam_role.elasticsearch-health-logger.id}"
}

resource "aws_iam_instance_profile" "elasticsearch-health-logger" {
  name = "${var.service_name}-${var.environment}-elasticsearch-health-logger-profile"
  path = "/"
  role = "${aws_iam_role.elasticsearch-health-logger.name}"
}
