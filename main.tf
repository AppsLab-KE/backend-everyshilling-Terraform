provider "aws {
   region= "us-east-1"
   version= "~>4.62.0"
}


resource "aws_instance" "devserver" {
  ami= "ami-004811053d831c2c2"
  instance_type = "t3.medium"
  key_name="popo"

  security_groups = [aws_security_group.devserver]
  tags = {
    Name = "devserverTF"
  }

}

resource "aws_security_group" "devserver" {
    name = "Security-Group"
    description= "dev environment on test"

    ingress {
        description = "Allow SSH"
        from_port= 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0]
    }

}

output "instance_public_ip" {
    value= aws_instance.web.instance_public_ip
}