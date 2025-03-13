output "public_subnet_name" {
  value = aws_subnet.public[*].tags.Name
}

output "public_subnet_id" {
  value = aws_subnet.public[*].id
}

