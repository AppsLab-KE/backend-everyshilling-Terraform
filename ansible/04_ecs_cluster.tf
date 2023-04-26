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

      subnet_ids = ["subnet-06e1e9eb5ee7646be", "subnet-0fa081145067c456e", "subnet-052ced4c028671464", "subnet-06e1e9eb5ee7646be"]
      security_group_rules = {
        alb_ingress_3000 = {
          type                     = "ingress"
          from_port                = 80
          to_port                  = 80
          protocol                 = "tcp"
          description              = "Service port"
          source_security_group_id = "sg-04579f7f77378b216"
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

}