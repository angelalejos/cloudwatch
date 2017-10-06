variable "aws_vpc_id" {
  description = "These templates assume a VPC already exists"
}

variable "service_name" {
  description = "Used as a prefix for all instances in case you are running several distinct services"
  default     = "pelias"
}

variable "environment" {
  description = "Which environment (dev, staging, prod, etc) this group of machines is for"
  default     = "dev"
}

variable "critical-alert-sns-topic-arn" {
  description = "An Amazon SNS topic ARN (for example, a PagerDuty event endpoint) that will be used as the alarm action for CRITICAL alerts"
}

variable "non-critical-alert-sns-topic-arn" {
  description = "An Amazon SNS topic ARN (for example, a PagerDuty event endpoint) that will be used as the alarm action for non-critical alerts"
}

variable "elasticsearch_host" {
  description = "A full URL that points to an Elasticsearch cluster to monitor. For example: http://localhost:9200"
}
