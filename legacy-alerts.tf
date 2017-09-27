# Legacy alerts for Elastic Load Balancers of non-Kubernetes Pelias infrastructure

# the common theme is to have one non-critical alert for any unhealthy hosts, and one critical for
# zero healthy hosts, for each ELB

resource "aws_cloudwatch_metric_alarm" "api-elb-unhealthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-api-elb-unhealthy-host-alert"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "${var.unhealthy-host-evaluation-periods}"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias API ELB for unhealthy hosts. Even one unhealthy host sends a non-critical alert"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-api-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.non-critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-api-elb-name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "api-elb-zero-healthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-api-elb-healthy-host-alert"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "HealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Minimum"
  threshold                 = "0"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias API ELB for healthy hosts. It sends a critical alert if there are no healthy hosts"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-api-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-api-elb-name}"
  }
}

# PIP
resource "aws_cloudwatch_metric_alarm" "pip-elb-unhealthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-pip-elb-unhealthy-host-alert"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "${var.unhealthy-host-evaluation-periods}"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias PIP ELB for unhealthy hosts. Even one unhealthy host sends a non-critical alert"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-pip-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.non-critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-pip-elb-name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "pip-elb-zero-healthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-pip-elb-healthy-host-alert"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "HealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Minimum"
  threshold                 = "0"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias PIP ELB for healthy hosts. It sends a critical alert if there are no healthy hosts"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-pip-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-pip-elb-name}"
  }
}

## Placeholder
resource "aws_cloudwatch_metric_alarm" "placeholder-elb-unhealthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-placeholder-elb-unhealthy-host-alert"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "${var.unhealthy-host-evaluation-periods}"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias Placeholder ELB for unhealthy hosts. Even one unhealthy host sends a non-critical alert"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-placeholder-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.non-critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-placeholder-elb-name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "placeholder-elb-zero-healthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-placeholder-elb-healthy-host-alert"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "HealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Minimum"
  threshold                 = "0"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias Placeholder ELB for healthy hosts. It sends a critical alert if there are no healthy hosts"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-placeholder-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-placeholder-elb-name}"
  }
}

## Interpolation
resource "aws_cloudwatch_metric_alarm" "interpolation-elb-unhealthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-interpolation-elb-unhealthy-host-alert"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "${var.unhealthy-host-evaluation-periods}"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias interpolation ELB for unhealthy hosts. Even one unhealthy host sends a non-critical alert"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-interpolation-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.non-critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-interpolation-elb-name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "interpolation-elb-zero-healthy-host-alert" {
  alarm_name                = "${var.service_name}-${var.environment}-interpolation-elb-healthy-host-alert"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "HealthyHostCount"
  namespace                 = "AWS/ELB"
  period                    = "60"
  statistic                 = "Minimum"
  threshold                 = "0"
  alarm_description         = "This metric monitors the legacy (non-kubernetes) Pelias Interpolation ELB for healthy hosts. It sends a critical alert if there are no healthy hosts"
  insufficient_data_actions = []

  actions_enabled = "${var.legacy_alerts_enabled  != "" ? 1 : 0}"
  count           = "${var.legacy-pelias-interpolation-elb-name  != "" ? 1 : 0}"
  alarm_actions   = ["${data.aws_sns_topic.critical-alerts.arn}"]

  dimensions {
    LoadBalancerName = "${var.legacy-pelias-interpolation-elb-name}"
  }
}
