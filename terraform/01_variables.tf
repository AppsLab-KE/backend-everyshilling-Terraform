variable "subnet_id" {
  description = "ID of the subnet to launch the instances in"
}

variable "security_group" {
  description = "Name of the security group"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  default     = "i-092e94a912388140d"
}
variable "tags" {
  description = "Resource tags "
}

variable "my_vpc" {
  description = "vpc creation "
}

variable "my_internet_gateway" {
  description = "internet gateway used in vpc"
}

variable "nat_gateway_route" {
  description = "NAT gateway value"
}


variable "subnets_cidr" {
  description = "vpc subnets cidr"
}