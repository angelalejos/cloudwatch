# create one log stream for elasticsearch logs, and another for K8S logs

resource "aws_cloudwatch_log_group" "pelias" {
  name = "${var.service_name}-${var.environment}-logs"

  tags {
    team = "${var.service_name}"
  }
}

resource "aws_cloudwatch_log_stream" "k8s" {
  name           = "${aws_cloudwatch_log_group.pelias.name}-k8s"
  log_group_name = "${aws_cloudwatch_log_group.pelias.name}"
}

resource "aws_cloudwatch_log_stream" "elasticsearch" {
  name           = "${aws_cloudwatch_log_group.pelias.name}-elasticsearch"
  log_group_name = "${aws_cloudwatch_log_group.pelias.name}"
}
