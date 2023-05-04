resource "aws_subnet" "private_subnet" {
  vpc_id = data.aws_vpc.main.id
  cidr_block = var.private_subnets[0]
  availability_zone = var.azs[0]
  map_public_ip_on_launch = false

}