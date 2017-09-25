variable "aws_access_key" {
  description = "The access key for the terraform user"
}

variable "aws_secret_key" {
  description = "The secret key for the terraform user"
}

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
