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
  default     = ["us-east-1a", "eu-west-1b", "eu-west-1c"]
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



variable "sg_ports" {
  description = "Security group ports"
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "ecs_cluster_name" {
  description = "ecs cluster"
  type        = string
}

variable "log-group" {
  description = "cloudwatch logs"
  type        = string
}



