resource "aws_security_group" "example" {
  name        = "example"
  description = "example"
  vpc_id      = var.vpc_id
  tags = {
    Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
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