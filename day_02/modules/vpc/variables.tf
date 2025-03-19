variable "env" {
  description = "The environment for the VPC."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "The AWS region to deploy resources."
  default     = "ap-southeast-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}



