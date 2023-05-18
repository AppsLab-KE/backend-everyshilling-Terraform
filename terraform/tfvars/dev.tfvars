tags = {
  project     = "Twala"
  environment = "dev"
  terraform   = "true"
  region      = "us-east-1"
  repo        = "https://github.com/AppsLab-KE/backend-everyshilling.git"
}

subnet_id        = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
security_group   = "swarm-sg"
instance_type    = "t2.micro"
key_name         = "popo"
ami              = "i-092e94a912388140d"
my_vpc           = "everyshilling-vpc"
my_internet_gateway = "everyshilling-ig"
nat_gateway_route = "0.0.0.0/0"