# Public Subnet 1 Creation
resource "aws_internet_gateway" "gw" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags = {
    Name = "${var.region}-internet-gateway"
  }
}

# Add route table in VPC
resource "aws_route_table" "public_route_table" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "${var.env}-${var.region}-route-table-Public"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "${var.env}-${var.region}-route-table-Private"
  }
}

# Add route to the Internet Gateway (IGW)
resource "aws_route" "internet_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

# Associate route table with public subnet
# resource "aws_route_table_association" "public" {
##   # route_table_id = aws_route_table.public_route_table.id
##   count = length(data.terraform_remote_state.public_subnet.id[*])
##   subnet_id      = data.terraform_remote_state.public_subnet.outputs.id[count.index]
## }