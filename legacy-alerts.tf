# Legacy alerts for Elastic Load Balancers of non-Kubernetes Pelias infrastructure

# the common theme is to have one non-critical alert for any unhealthy hosts, and one critical for
# zero healthy hosts, for each ELB

module "api-elb-alerts" {
  source = "./modules/elb-alerts"

  service_name                      = "${var.service_name}"
  environment                       = "${var.environment}"
  actions_enabled                   = "${var.legacy_alerts_enabled}"
  unhealthy-host-evaluation-periods = "${var.unhealthy-host-evaluation-periods}"
  critical-alert-sns-topic-arn      = "${data.aws_sns_topic.critical-alerts.arn}"
  non-critical-alert-sns-topic-arn  = "${data.aws_sns_topic.non-critical-alerts.arn}"

  friendly-lb-name = "API"
  lb-name          = "${var.legacy-pelias-api-elb-name}"
}

module "pip-elb-alerts" {
  source = "./modules/elb-alerts"

  service_name                      = "${var.service_name}"
  environment                       = "${var.environment}"
  actions_enabled                   = "${var.legacy_alerts_enabled}"
  unhealthy-host-evaluation-periods = "${var.unhealthy-host-evaluation-periods}"
  critical-alert-sns-topic-arn      = "${data.aws_sns_topic.critical-alerts.arn}"
  non-critical-alert-sns-topic-arn  = "${data.aws_sns_topic.non-critical-alerts.arn}"

  friendly-lb-name = "PIP"
  lb-name          = "${var.legacy-pelias-pip-elb-name}"
}

module "placeholder-elb-alerts" {
  source = "./modules/elb-alerts"

  service_name                      = "${var.service_name}"
  environment                       = "${var.environment}"
  actions_enabled                   = "${var.legacy_alerts_enabled}"
  unhealthy-host-evaluation-periods = "${var.unhealthy-host-evaluation-periods}"
  critical-alert-sns-topic-arn      = "${data.aws_sns_topic.critical-alerts.arn}"
  non-critical-alert-sns-topic-arn  = "${data.aws_sns_topic.non-critical-alerts.arn}"

  friendly-lb-name = "Placeholder"
  lb-name          = "${var.legacy-pelias-placeholder-elb-name}"
}

module "interpolation-elb-alerts" {
  source = "./modules/elb-alerts"

  service_name                      = "${var.service_name}"
  environment                       = "${var.environment}"
  actions_enabled                   = "${var.legacy_alerts_enabled}"
  unhealthy-host-evaluation-periods = "${var.unhealthy-host-evaluation-periods}"
  critical-alert-sns-topic-arn      = "${data.aws_sns_topic.critical-alerts.arn}"
  non-critical-alert-sns-topic-arn  = "${data.aws_sns_topic.non-critical-alerts.arn}"

  friendly-lb-name = "Interpolation"
  lb-name          = "${var.legacy-pelias-interpolation-elb-name}"
}
