output "vpc_id" {
  value = data.terraform_remote_state.vpc
}

output "public_subnet_id" {
  value = data.terraform_remote_state.public_subnet.outputs
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "route_table_name" {
  value = aws_route_table.public_route_table.tags.Name
}