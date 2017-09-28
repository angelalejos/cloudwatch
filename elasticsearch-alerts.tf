# set up alerts on the Elasticsearch ELB
module "elasticsearch-elb-alerts" {
  source = "./modules/elb-alerts"

  service_name                      = "${var.service_name}"
  environment                       = "${var.environment}"
  actions_enabled                   = "${var.alerts_enabled}"
  unhealthy-host-evaluation-periods = "${var.unhealthy-host-evaluation-periods}"
  healthy-host-evaluation-periods   = "${var.healthy-host-evaluation-periods}"
  critical-alert-sns-topic-arn      = "${data.aws_sns_topic.critical-alerts.arn}"
  non-critical-alert-sns-topic-arn  = "${data.aws_sns_topic.non-critical-alerts.arn}"

  friendly-lb-name = "Elasticsearch"
  lb-name          = "${var.pelias-elasticsearch-elb-name}"
}
