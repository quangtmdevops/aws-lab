terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Public Subnet Creation
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.public_subnet_az
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}

# EC2 Instance Creation
resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id

  tags = {
    Name = var.instance_name
  }
}

# Internet Gateway for public access
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

# Route Table for public access
resource "aws_route_table" "public" {
  vpc_id         = aws_vpc.main.id
}

# Route for public internet access
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.route_cidr_block
  gateway_id             = aws_internet_gateway.main.id
}

# Associate route table with public subnet
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}