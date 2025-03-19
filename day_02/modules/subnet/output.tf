output "vpc_id" {
  value = data.terraform_remote_state.vpc
}

output "public_subnet_name" {
  value = aws_subnet.public[*].tags.Name
}

output "public_subnet_cidr" {
  value = aws_subnet.public[*].cidr_block
}

output "private_subnet_name" {
  value = aws_subnet.private[*].tags.Name
}

output "private_subnet_cidr" {
  value = aws_subnet.private[*].cidr_block
}
