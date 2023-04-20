tags = {
  project     = "Every-shilling"
  environment = "dev"
  terraform   = "true"
  region      = "us-east-1"
  repo        = "https://github.com/AppsLab-KE/backend-everyshilling-Terraform"
}


sg_ports = {
  ssh = {
    port        = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tcp = {
    port        = 4010
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]
  }
  https = {
    port        = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tcp = {
    port        = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

vpc_cidr              = "10.0.0.0/16"
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets       = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets        = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
region                = "us-east-1"
key_name              = "elcy-dev"
cluster_name          = "samplecluster"