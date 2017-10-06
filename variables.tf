variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "AWS region to launch servers."
  default     = "us-east-1a,us-east-1b,us-east-1c,us-east-1d,us-east-1e"
}

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

variable "pelias-elasticsearch-url" {}

variable "pelias-elasticsearch-elb-name" {
  description = "The full name of the ELB in front of Elasticsearch instances"
}

variable "legacy-pelias-api-elb-name" {
  description = "The full name of the ELB running the legacy Pelias API (not in kubernetes). If blank no alerts for this ELB will be created"
}

variable "legacy-pelias-placeholder-elb-name" {}
variable "legacy-pelias-pip-elb-name" {}
variable "legacy-pelias-interpolation-elb-name" {}

variable "critical-alert-sns-topic-name" {
  description = "An Amazon SNS topic (for example, a PagerDuty event endpoint) that will be used as the alarm action for CRITICAL alerts"
}

variable "non-critical-alert-sns-topic-name" {
  description = "An Amazon SNS topic (for example, a PagerDuty event endpoint) that will be used as the alarm action for non-critical alerts"
}

variable "alerts_enabled" {
  default = "true"
}

variable "legacy_alerts_enabled" {
  default = "true"
}

variable "unhealthy-host-evaluation-periods" {
  description = "How many periods (which default to minutes) the unhealthy host count alerts for ELBs must be in an unacceptable state for before alerting. This should be set fairly high especailly in dev environments to avoid excessive alerts"
  default     = 10
}

variable "healthy-host-evaluation-periods" {
  description = "How many periods (which default to minutes) the healthy host count alerts for ELBs must be in an unacceptable state for before alerting. This should be set fairly low except perhaps in dev environments, since it represents a complete service failure."
  default     = 2
}
