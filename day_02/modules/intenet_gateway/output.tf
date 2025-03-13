output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "route_table_id" {
  value = aws_route_table.rtb.id
}

output "route_table_name" {
  value = aws_route_table.rtb.tags.Name
}