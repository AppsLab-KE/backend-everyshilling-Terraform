#security group to avoid extrenal connection to container
resource "aws_security_group" "service_security_group" {
  

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


#security group