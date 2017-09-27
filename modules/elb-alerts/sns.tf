# this configures data sources for the Amazon SNS topics that send data to pagerduty
# these data sources are used as the action for other alerts, they aren't modified at all

# data source for alerts that should wake someone up
data "aws_sns_topic" "critical-alerts" {
  name = "${var.critical-alert-sns-topic-name}"
}

# data source for alerts that should not wake someone up
data "aws_sns_topic" "non-critical-alerts" {
  name = "${var.non-critical-alert-sns-topic-name}"
}
