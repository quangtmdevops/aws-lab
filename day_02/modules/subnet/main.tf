# Public Subnet 1 Creation
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr) / 2
  cidr_block              = var.public_subnet_cidr[count.index * 2 + 1]
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "${var.env}_${count.index * 2}_Public_subnet_${data.aws_availability_zones.available.names[0]}"
  }
}

# Private Subnet 1 Creation
resource "aws_subnet" "private" {
  count                   = length(var.public_subnet_cidr) / 2
  cidr_block              = var.public_subnet_cidr[count.index * 2]
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "${var.env}_${count.index * 2 + 1}_Private_subnet_${data.aws_availability_zones.available.names[1]}"
  }
}

