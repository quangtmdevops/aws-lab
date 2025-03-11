variable "ami" {
  description = "The AMI ID to use for the instance"
  type = string
}

variable "instance_type" {
  description = "The type of the instance"
  type = string
  default = "t2.micro"
}