3 SCRIPT INCASE ONE DECICDES TO USE AWS TERRAFORM ECS FOR THE SERVICES.
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
      cpu    = 1024
      memory = 4096

      # Container definition(s)
      container_definitions = {

        app-auth = {
          cpu       = 250
          memory    = 1024
          essential = true
          image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:auth"
          port_mappings = [
            {
              name          = "app-auth"
              containerPort = 302
              protocol      = "tcp"
            }
          ]

          memory_reservation = 100
        }
        app-otp = {
          cpu       = 250
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
          cpu       = 250
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




aws ecs describe-tasks \
     --cluster cluster_name \
     --tasks arn:aws:ecs:us-east-1:540828511394:task/everyshilling-dev/arn:aws:ecs:us-east-1:540828511394:task/everyshilling-dev/1c3f25742e054ffc92da5ee40d5d9cae \
     --region us-east-1
