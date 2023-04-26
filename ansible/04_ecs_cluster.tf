resource "aws_ecs_cluster" "ecs_cluster" {
  name = format("%s-dev",var.ecs_cluster_name)
}

resource "aws_ecs_task_definition" "ecs-sample" {
  family                   = "ecs-sample"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode([
    {
      name  = "app-auth"
      image = ":540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:auth"
      portMappings = [
        {
          containerPort = 3002
          protocol      = "tcp"
        }
      ]
    },
    {
      name  = "app-db"
      image = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:db"
      portMappings = [
        {
          containerPort = 3001
          protocol      = "tcp"
        }
      ],

    },
    {
      name  = "app-otp"
      image = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:otp"
      portMappings = [
        {
          containerPort = 3008
          protocol      = "tcp"
        }
      ],

    },
    {
      name  = "postgres"
      image = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:postgres"
      portMappings = [
        {
          containerPort = 5432
          protocol      = "tcp"
        }
      ],
      environment = [
        {
          name  = "POSTGRES_USER"
          value = "postgres"
        },
        {
          name  = "POSTGRES_PASSWORD"
          value = "password"
        },
        {
          name  = "POSTGRES_DB"
          value = "everyshillings"
        }
      ]
    },
     {
      name  = "redis"
      image = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:redis"
      portMappings = [
        {
          containerPort = 3007
          protocol      = "tcp"
        }
      ],

    }
  ])

  
}
