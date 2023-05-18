
# resource "aws_vpc" "main" {
#   cidr_block           = "10.95.0.0/16"
#   enable_dns_hostnames = true
# }

# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id
# }

# resource "aws_route" "internet_access" {
#   route_table_id         = aws_vpc.main.main_route_table_id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.main.id
# }

# resource "aws_security_group" "exposed" {
#   name   = "exposed"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_network_acl" "my_network_acl" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_network_acl_rule" "ssh_ingress_rule" {
  network_acl_id = aws_network_acl.my_network_acl.id
  rule_number    = 100
  protocol       = "6"  # TCP
  rule_action    = "allow"
  egress         = false
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

