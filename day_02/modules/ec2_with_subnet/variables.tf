variable "region" {
  description = "The AWS region to deploy resources."
  default     = "ap-southeast-1"
}

variable "env" {
  description = "The environment for the VPC."
  type        = string
  default     = "dev"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
  ]
}

variable "public_subnet_az" {
  description = "The availability zone for the public subnet."
  type        = list(string)
  default     = ["a", "b"]
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type = string
}