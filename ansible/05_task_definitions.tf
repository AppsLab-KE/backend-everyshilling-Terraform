resource "aws_ecs_task_definition" "service" {
  family = "service"

  container_definitions = jsonencode([
    {
      name      = format("nginx-%s",var.tags["environment"])
      image     = "nginx"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 0
        }
      ]
    },
    {
      name      = format("nginx1-%s",var.tags["environment"])
      image     = "nginx"
      cpu       = 10
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 0
        }
      ]
    }
  ])


  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b, us-east-1c]"
  }


}