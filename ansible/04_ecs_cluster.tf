module "ecs" {
  source = "terraform-aws-modules/ecs/aws"
  cluster_name = format("everyshilling-%s", var.tags["environment"])
  


  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }

  services = {
    everyshilling = {
      cpu    = 4096
      memory = 8192

      # Container definition(s)
      container_definitions = {

        app-auth = {
          cpu       = 300
          memory    = 1024
          essential = true
          image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:auth"
          port_mappings = [
            {
              name          = "app-auth"
              containerPort = 3002
              protocol      = "tcp"
            }
          ]

          memory_reservation = 100
        }

        app-otp = {
          cpu       = 300
          memory    = 1024
          essential = true
          image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:otp"
          port_mappings = [
            {
              name          = "app-otp"
              containerPort = 3008
              protocol      = "tcp"
            }
          ]

          memory_reservation = 100
        }

        redis = {
          cpu       = 300
          memory    = 1024
          essential = true
          image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:redis"
          port_mappings = [
            {
              name          = "redis"
              containerPort = 3007
              protocol      = "tcp"
            }
          ]

          memory_reservation = 100
        }

        postgres = {
          cpu       = 300
          memory    = 1024
          essential = true
          image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:postgres"
          port_mappings = [
            {
              name          = "postgres"
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
          memory_reservation = 100
        }

        app-db = {
          cpu       = 300
          memory    = 1024
          essential = true
          image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:db"
          port_mappings = [
            {
              name          = "db"
              containerPort = 3001
              protocol      = "tcp"
            }
          ]
          memory_reservation = 100
        }

      }

      subnet_ids = ["subnet-03b3e5120c1f25884", "subnet-0a2c845ec2f4508c6", "subnet-0231d3bef9789ded7", "subnet-0d9dceb275616558e","subnet-0acb9880b5f76f8b5","subnet-0b3fd9785f80d31b8"]
      security_group_rules = {
        alb_ingress_3000 = {
          type                     = "ingress"
          from_port                = 80
          to_port                  = 80
          protocol                 = "tcp"
          description              = "Service port"
          source_security_group_id = "sg-0a1f0a42a90de09bc"
        }
        egress_all = {
          type        = "egress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
  }

  # iam_task_execution_role_policy = jsonencode({
  #   Version = "2012-10-17"
  #   Statement = [
  #     {
  #       Action = [
  #         "ecr:GetAuthorizationToken",
  #         "ecr:GetDownloadUrlForLayer",
  #         "ecr:BatchGetImage",
  #         "ecr:BatchCheckLayerAvailability"
  #       ]
  #       Effect = "Allow"
  #       Resource = "*"
  #     }
  #   ]
  # })
}
