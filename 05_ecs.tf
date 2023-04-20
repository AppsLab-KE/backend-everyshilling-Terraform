resource "aws_ecs_cluster" "web-cluster" {
  name               = var.cluster_name

  tags = {
  project_owner = "Appslab"
  }
}


# updated file container-def, so it's pulling image from ecr
resource "aws_ecs_task_definition" "task-definition-test" {
  family                = "web-family"
  container_definitions = jsonencode(
  [
    {
      "name": "app-auth",
      "image": "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:app-auth",
      "cpu": 10,
      "memory": 256,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group" : "/ecs/container",
          "awslogs-region": "us-east-1"
        }
      }
    }
])


  network_mode          = "bridge"
   tags = {
    project_owner = "Appslab"
  }
}

resource "aws_ecs_service" "service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-test.arn
  desired_count   = 3
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "app-auth"
    container_port   = 80
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.web-listener]
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/ecs/frontend-container"
   tags = {
    project_owner = "Appslab"
  }
}



