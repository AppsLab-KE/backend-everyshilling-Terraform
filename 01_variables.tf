variable "tags" {
  description = "The tags to be used for the different resources in the Elcy project"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "IP Cidr for the VPC"
  type        = string
}

variable "azs" {
  description = "The availability zones for the region"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "private_subnets" {
  description = "VPC private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "VPC public subnets"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "Ec2 AMI ID to use"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "enable_ec2_monitoring" {
  description = "Enable EC2 monitoring"
  type        = bool
}

variable "sg_ports" {
  description = "Security group ports"
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}