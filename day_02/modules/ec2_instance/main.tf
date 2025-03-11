resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = []

  tags = {
    Name = "day2_terrafom_ec2_instance"
  }
}
# aws ec2 describe-security-groups --filters "Name=vpc-id,Values=<vpc-id>" --query "SecurityGroups[].GroupId"