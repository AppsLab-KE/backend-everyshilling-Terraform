module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = format ("%s-dev",var.tags["environment"])

#   cluster_configuration = {
#     execute_command_configuration = {
#       logging = "OVERRIDE"
#       log_configuration = {
#         cloud_watch_log_group_name = "/aws/ecs/aws-ec2"
#       }
#     }
#   }

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }

  }

   services = {
    everyshillings = {
      cpu    = 1024
      memory = 4096

      # Container definition(s)
      container_definitions = {

        app-auth = {
          cpu       = 512
          memory    = 1024
          essential = true
          image     =":540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:auth"
          portMappings = [
                {
                containerPort = 3002
                protocol      = "tcp"
                }
          ]
          memory_reservation = 50
        }

        app-otp = {
          cpu       = 512
          memory    = 1024
          essential = true
          image = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:otp"
          portMappings = [
                {
                containerPort = 3008
                protocol      = "tcp"
                },
            ],

           dependencies = [{
               containerName = "redis"
               condition     = "START"
            },
            {
               containerName = "app-db"
               condition     = "START"
            },
           ],
          }
             memory_reservation = 50

        }

        app-db = {
          cpu       = 512
          memory    = 1024
          essential = true
           name  = "app-db"
           image = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:db"
           portMappings = [
               {
               containerPort = 3001
               protocol      = "tcp"
               },
           ],
            dependencies = [{
            containerName = "postgres"
            condition     = "START"
          }]


        }

        redis = {
          cpu       = 512
          memory    = 1024
          essential = true
          image = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:redis"
          portMappings = [
               {
               containerPort = 3007
               protocol      = "tcp"
               }
        ],

        }

        postgres = {
          cpu       = 512
          memory    = 1024
          essential = true
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

          # Example image used requires access to write to root filesystem
          readonly_root_filesystem = false
          memory_reservation = 100
        }
        }

    #     service_connect_configuration = {
    #     namespace = "everyshilling"
    #     service = {
    #       client_alias = {
    #         port     = 80
    #         dns_name = "ecs-sample"
    #       }
    #       port_name      = "ecs-sample"
    #       discovery_name = "ecs-sample"
    #     }
    #   }

    #   load_balancer = {
    #     service = {
    #       target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:1234567890:targetgroup/bluegreentarget1/209a844cd01825a4"
    #       container_name   = "ecs-sample"
    #       container_port   = 80
    #     }
    #   }

#       subnet_ids = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
#       security_group_rules = {
#         alb_ingress_3000 = {
#           type                     = "ingress"
#           from_port                = 80
#           to_port                  = 80
#           protocol                 = "tcp"
#           description              = "Service port"
#           source_security_group_id = "sg-12345678"
#         }
#         egress_all = {
#           type        = "egress"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_blocks = ["0.0.0.0/0"]
#         }
#       }
#     }
   }

}