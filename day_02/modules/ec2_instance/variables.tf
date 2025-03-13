variable "ami" {
  description = "The AMI ID to use for the instance"
  type = string
  default = "ami-0c1907b6d738188e5"
}

variable "instance_type" {
  description = "The type of the instance"
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type = string
}

variable "vpc_id" {
    description = "The ID of the VPC."
    type = string
}

variable "sg_from_port" {
  description = "The start port for the security group"
  type = number
  default = 22
}

variable "sg_to_port" {
  description = "The end port for the security group"
  type = number
  default = 22
}

variable "protocol" {
  type = string
  default = "tcp"
}

variable "sg_cidr_blocks" {
  description = "The CIDR block for the security group"
  type = list(string)
  # default = ["222.252.28.231/32"]
  default = ["0.0.0.0/0"]
}
