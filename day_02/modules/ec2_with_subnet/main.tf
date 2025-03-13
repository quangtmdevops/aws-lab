# Public Subnet 1 Creation
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)
  vpc_id                  = var.vpc_id
  # vpc_id                  = data.terraform_remote_state.vpc.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = "${var.region}${element(var.public_subnet_az, count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.region}${element(var.public_subnet_az, count.index)}-public-subnet"
  }
}
