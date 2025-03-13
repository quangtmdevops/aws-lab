variable "region" {
  description = "The AWS region to deploy resources."
  default     = "ap-southeast-1"
}

variable "env" {
  description = "The environment for the VPC."
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type = string
}

variable "subnet_id_list" {
  description = "The ID of the subnet."
  type = list(string)
}
