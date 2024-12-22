variable "environment" {
  description = "The environment to deploy (dev, staging, prod)"
  type        = string
}

variable "app_name" {
  description = "Name of the microservice application"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}
