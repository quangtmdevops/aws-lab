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

