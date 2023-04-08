module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name = format("elcy-%s", var.tags["environment"])

  ami                    = var.ami_id
  instance_type          = var.ec2_instance_type
  key_name               = format("elcy-%s", var.tags["environment"])
  monitoring             = var.enable_ec2_monitoring
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    project_owner = "Appslab"
  }
}