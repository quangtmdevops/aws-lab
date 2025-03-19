variable "region" {
  description = "The AWS region to deploy resources."
  default     = "ap-southeast-1"
}

variable "env" {
  description = "The environment for the VPC."
  type        = string
  default     = "dev"
}
