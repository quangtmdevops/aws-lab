output "vpc_name" {
  value = aws_vpc.main.tags.Name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}