resource "aws_instance" "master_instance" {
  instance_type = "t2.micro"
  ami           = "ami-007855ac798b5175e"  # Replace with your desired AMI ID
  key_name      = "popo"     # Replace with your EC2 key pair name
  subnet_id     = aws_subnet.sbnt[0].id  # Replace with your subnet ID
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
  subnet_id     = aws_subnet.sbnt[1].id  # Replace with your subnet ID
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
