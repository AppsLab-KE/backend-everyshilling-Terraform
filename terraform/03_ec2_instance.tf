resource "aws_instance" "master" {
 ami           = "ami-02396cdd13e9a1257"
 instance_type = "t3a.micro"
}

resource "aws_instance" "worker1" {
 ami           = "ami-02396cdd13e9a1257"
 instance_type = "t3a.medium"

}

resource "aws_instance" "worker2" {
 ami           = "ami-02396cdd13e9a1257"
 instance_type = "t3a.medium"
}