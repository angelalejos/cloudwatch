/*resource "aws_cloudwatch_log_metric_filter" "elasticsearch-unhealthy-indices" {*/
  /*name = "non-green index count"*/

  /*pattern        = "{ $.health != \"green\" }"*/
  /*log_group_name = "pelias-dev"*/

  /*metric_transformation {*/
    /*name      = "UnhealthyIndices"*/
    /*namespace = "pelias-dev"*/
    /*value     = "1"*/
  /*}*/
/*}*/

/*resource "aws_cloudwatch_log_metric_filter" "elasticsearch-healthy-indices" {*/
  /*name = "green index count"*/

  /*pattern        = "{ $.health = \"green\" }"*/
  /*log_group_name = "pelias-dev"*/

  /*metric_transformation {*/
    /*name      = "HealthyIndices"*/
    /*namespace = "pelias-dev"*/
    /*value     = "1"*/
  /*}*/
/*}*/

/*resource "aws_cloudwatch_metric_alarm" "unhealthy-index-alert" {*/
  /*alarm_name          = "${var.service_name}-${var.environment}-unhealthy-index-alert"*/
  /*comparison_operator = "GreaterThanOrEqualToThreshold"*/
  /*evaluation_periods  = "2"*/
  /*metric_name         = "UnhealthyIndices"*/
  /*namespace           = "pelias-dev"*/
  /*period              = "60"*/
  /*statistic           = "Maximum"*/
  /*threshold           = "1"*/
  /*alarm_description   = ""*/
  /*treat_missing_data  = "notBreaching"*/
/*}*/

/*resource "aws_cloudwatch_metric_alarm" "healthy-index-alert" {*/
  /*alarm_name          = "${var.service_name}-${var.environment}-healthy-index-alert"*/
  /*comparison_operator = "LessThanOrEqualToThreshold"*/
  /*evaluation_periods  = "2"*/
  /*metric_name         = "HealthyIndices"*/
  /*namespace           = "pelias-dev"*/
  /*period              = "60"*/
  /*statistic           = "Maximum"*/
  /*threshold           = "0"*/
  /*alarm_description   = ""*/
  /*treat_missing_data  = "breaching"*/
/*}*/
