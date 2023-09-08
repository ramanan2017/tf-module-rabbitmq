resource "aws_security_group" "main" {
  name        = local.sg_name
  description = local.sg_name
  vpc_id      = var.vpc_id
  tags = merge(local.tags, {Name = local.sg_name})

  ingress {
    description      = "App"
    from_port        = var.sg_port
    to_port          = var.sg_port
    protocol         = "tcp"
    cidr_blocks      = var.sg_ingress_cidr

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}