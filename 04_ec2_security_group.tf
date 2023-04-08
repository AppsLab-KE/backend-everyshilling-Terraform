resource "aws_security_group" "sg" {
  name   = format("elcy-%s", var.tags["environment"])
  vpc_id = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    project_owner = "Appslab"
  }
}