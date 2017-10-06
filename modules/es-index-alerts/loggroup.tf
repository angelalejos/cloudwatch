resource "aws_cloudwatch_log_group" "elasticsearch-index-health" {
  name = "${var.service_name}/${var.environment}/elasticsearch-index-health"
}
