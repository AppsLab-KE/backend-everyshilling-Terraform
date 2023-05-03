# #security group to avoid extrenal connection to container
# resource "aws_security_group" "service_security_group" {

#   ingress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }

resource "aws_security_group" "load_balancer" {
  name_prefix = "unknown"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_lb" "everyshilling_lb" {
  name               = "everyshilling-lb"
  internal           = false
  load_balancer_type = "network"

  security_groups = [aws_security_group.load_balancer.id]
}

resource "aws_lb_target_group" "everyshilling_tg" {
  name     = "every-shilling-dev-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_lb_listener" "everyshilling_listener" {
  load_balancer_arn = aws_lb.everyshilling_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.everyshilling_tg.arn
    type             = "forward"
  }
}

