variable "service_name" {
  description = "Used as a prefix for all instances in case you are running several distinct services"
  default     = "pelias"
}

variable "environment" {
  description = "Which environment (dev, staging, prod, etc) this group of machines is for"
  default     = "dev"
}

variable "friendly-lb-name" {}

variable "lb-name" {}

variable "critical-alert-sns-topic-name" {
  description = "An Amazon SNS topic (for example, a PagerDuty event endpoint) that will be used as the alarm action for CRITICAL alerts"
}

variable "non-critical-alert-sns-topic-name" {
  description = "An Amazon SNS topic (for example, a PagerDuty event endpoint) that will be used as the alarm action for non-critical alerts"
}

variable "actions_enabled" {
  description = "Whether the created alerts should actually trigger their actions or not. If not, they exist, but never actually do anything, which can be useful in development environments for testing alerts without actually bugging anyone with emails or phone calls"
  default     = "true"
}

variable "legacy_alerts_enabled" {
  default = "true"
}

variable "unhealthy-host-evaluation-periods" {
  description = "How many periods (which default to minutes) the unhealthy host count alerts for ELBs must be in an unacceptable state for before alerting. This should be set fairly high especailly in dev environments to avoid excessive alerts"
  default     = 10
}
