
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = false
  enable_dns_hostnames = false

  tags = {
    Name = "${var.env}-asg"
  }
}


#
# # EC2 Instance Creation
# resource "aws_instance" "example" {
#   ami = var.ami
#   instance_type = var.instance_type
#   subnet_id = aws_subnet.public.id
#
#   tags = {
#     Name = "${var.env}-main"
#   }
# }
#
# # Internet Gateway for public access
# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id
#
#   tags = {
#     Name = var.igw_name
#   }
# }
#
# # Route Table for public access
# resource "aws_route_table" "public" {
#   vpc_id         = aws_vpc.main.id
# }
#
# # Route for public internet access
# resource "aws_route" "internet_access" {
#   route_table_id         = aws_route_table.public.id
#   destination_cidr_block = var.route_cidr_block
#   gateway_id             = aws_internet_gateway.main.id
# }
#
# # Associate route table with public subnet
# resource "aws_route_table_association" "public" {
#   subnet_id = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }