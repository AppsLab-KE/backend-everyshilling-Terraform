
# # resource "aws_vpc" "my_vpc" {
# #   cidr_block = "10.0.0.0/16"
# #   instance_tenancy = "default"
# # }

# # resource "aws_route_table" "my_route_table" {
# #   vpc_id = aws_vpc.my_vpc.id
# # }

# # resource "aws_network_acl" "my_network_acl" {
# #   vpc_id = aws_vpc.my_vpc.id
# # }

# # resource "aws_network_acl_rule" "ssh_ingress_rule" {
# #   network_acl_id = aws_network_acl.my_network_acl.id
# #   rule_number    = 100
# #   protocol       = "6"  # TCP
# #   rule_action    = "allow"
# #   egress         = false
# #   cidr_block     = "0.0.0.0/0"
# #   from_port      = 22
# #   to_port        = 22
# # }
# # Creating VPC
# resource "aws_vpc" "my_vpc" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "My-VPC"
#   }
# }

# # Creating subnets inside the above-created VPC
# resource "aws_subnet" "sbnt" {
#   count                     = length(var.subnets_cidr)
#   vpc_id                    = aws_vpc.my_vpc.id
#   cidr_block                = element(var.subnets_cidr, count.index)
#   map_public_ip_on_launch   = true
#   assign_ipv6_address_on_creation = false

#   tags = {
#     Name = "My-Subnet-${count.index + 1}"
#   }
# }

# # Creating internet gateway for our subnets to be able to connect to the internet
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.my_vpc.id

#   tags = {
#     Name = "My-IGW"
#   }
# }

# # Creating a route table
# resource "aws_route_table" "rt" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "Public-Routing-Table"
#   }
# }

# # Associating route table with subnets
# resource "aws_route_table_association" "a" {
#   count          = length(var.subnets_cidr)
#   subnet_id      = element(aws_subnet.sbnt.*.id, count.index)
#   route_table_id = aws_route_table.rt.id
# }

# Creating VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "My-VPC"
  }
}

# Creating subnets inside the above-created VPC
resource "aws_subnet" "sbnt" {
  count                     = length(var.subnets_cidr)
  vpc_id                    = aws_vpc.my_vpc.id
  cidr_block                = element(var.subnets_cidr, count.index)
  map_public_ip_on_launch   = true
  assign_ipv6_address_on_creation = false

  tags = {
    Name = "My-Subnet-${count.index + 1}"
  }
}

# Creating internet gateway for our subnets to be able to connect to the internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My-IGW"
  }
}

# Creating a route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Routing-Table"
  }
}

# Associating route table with subnets
resource "aws_route_table_association" "a" {
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.sbnt.*.id, count.index)
  route_table_id = aws_route_table.rt.id
}

# Creating network ACL
resource "aws_network_acl" "my_network_acl" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My-Network-ACL"
  }
}

# Creating network ACL inbound rule for SSH access
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
