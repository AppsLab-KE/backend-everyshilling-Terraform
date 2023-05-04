output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}

output "azs" {
  value = module.vpc.azs
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}


output "igw_id" {
  value = module.vpc.igw_id
}

output "alb_dns" {
  value = aws_lb.test-lb.dns_name
}