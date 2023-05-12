

# module "swarm_master" {
#   source      = "./modules/ec2-instance"
#   instance_count = 1
#   instance_name  = "master"
#   instance_type  = "t2.micro"
#   ami_id         = "ami-007855ac798b5175e" # Replace with your desired AMI ID
#   key_name       = "elcy-dev"    # Replace with your EC2 key pair name
#   subnet_id      = "subnet-0ffff48fb61c272f3" # Replace with your subnet ID
#   security_group_ids = [module.master_sg.security_group_id]
# }

# module "swarm_worker" {
#   source      = "./modules/ec2-instance"
#   instance_count = 2
#   instance_name  = "swarm-worker"
#   instance_type  = "t2.micro"
#   ami_id         = "ami-007855ac798b5175e" # Replace with your desired AMI ID
#   key_name       = "elcy-dev"    # Replace with your EC2 key pair name
#   subnet_id      = "subnet-0ffff48fb61c272f3" # Replace with your subnet ID
#   security_group_ids = [module.worker_sg.security_group_id]
# }

# # module "master_sg" {
# #   source  = "./modules/security-group"
# #   name    = "swarm-master-sg"
# #   vpc_id  = "vpc-0123456789abcdef" # Replace with your VPC ID
# #   ingress_ports = [22, 80, 7946, 2377, 4789]
# # }

# # module "worker_sg" {
# #   source  = "./modules/security-group"
# #   name    = "swarm-worker-sg"
# #   vpc_id  = "vpc-0123456789abcdef" # Replace with your VPC ID
# #   ingress_ports = [22, 7946, 4789]
# # }
resource "aws_instance" "master_instance" {
  instance_type = "t2.micro"
  ami           = "ami-007855ac798b5175e"  # Replace with your desired AMI ID
  key_name      = "popo"     # Replace with your EC2 key pair name
  subnet_id     = aws_subnet.my_subnet.id  # Replace with your subnet ID
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  associate_public_ip_address = true
  tags = {
    Name = "swarm-master"
    Environment = "dev"
  }
}
resource "aws_instance" "worker_instance" {
  instance_type = "t2.micro"
  ami           = "ami-007855ac798b5175e"  # Replace with your desired AMI ID
  key_name      = "popo"     # Replace with your EC2 key pair name
  subnet_id     = aws_subnet.my_subnet.id  # Replace with your subnet ID
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  associate_public_ip_address = true
  tags = {
    Name = "swarm-worker"
    Environment = "dev"
  }
}

# resource "aws_instance" "worker2_instance" {
#   instance_type = "t2.micro"
#   ami           = "ami-007855ac798b5175e"  # Replace with your desired AMI ID
#   key_name      = "elcy-dev"     # Replace with your EC2 key pair name
#   subnet_id     = aws_subnet.my_subnet.id  # Replace with your subnet ID
#   vpc_security_group_ids = [aws_security_group.my_security_group.id]
#   tags = {
#     Name = "docker-swarm-worker"
#     Environment = "dev"
#   }
# }
