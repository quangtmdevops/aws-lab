resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = aws_security_group.this.id[*]
  subnet_id = var.subnet_id
  key_name = aws_key_pair.this.key_name
  tags = {
    Name = "day2_terrafom_ec2_instance"
  }
}

resource "aws_key_pair" "this" {
  key_name   = "cystack-pc-key-pair"           # The name of the key pair
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public SSH key
}