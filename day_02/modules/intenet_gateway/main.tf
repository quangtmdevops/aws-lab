# Public Subnet 1 Creation
resource "aws_internet_gateway" "gw" {
  vpc_id                  = var.vpc_id

  tags = {
    Name = "${var.region}-internet-gateway"
  }
}

# Add route table in VPC
resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.env}-${var.region}-route-table-Public"
  }
}

# Add route to the Internet Gateway (IGW)
resource "aws_route" "internet_route" {
  route_table_id = aws_route_table.rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

#Associate route table with public subnet
resource "aws_route_table_association" "public" {
  count = length(var.subnet_id_list)
  subnet_id      = var.subnet_id_list[count.index]
  route_table_id = aws_route_table.rtb.id
}