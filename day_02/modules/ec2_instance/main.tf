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

resource "aws_security_group" "this" {
  vpc_id = var.vpc_id

  ingress {
    from_port = var.sg_from_port
    to_port   = var.sg_to_port
    protocol  = var.protocol
    # cidr_blocks = var.sg_cidr_blocks
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule to allow TCP traffic on port 80 (HTTP)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"
    cidr_blocks = var.sg_cidr_blocks
  }

  egress {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}