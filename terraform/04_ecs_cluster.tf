# module "ecs" {
#   source = "terraform-aws-modules/ecs/aws"
#   cluster_name = format("everyshilling-%s", var.tags["environment"])

#   cluster_configuration = {
#     execute_command_configuration = {
#       logging = "OVERRIDE"
#       log_configuration = {
#         cloud_watch_log_group_name = "/aws/ecs/aws-ec2"
#       }
#     }
#   }

#   fargate_capacity_providers = {
#     FARGATE = {
#       default_capacity_provider_strategy = {
#         weight = 50
#       }
#     }
#   }

#   services = {
#     everyshilling = {
#       cpu    = 4096
#       memory = 8192

#     # runtime_platform = {
#     #    operating_system_family = "LINUX"
#     #    cpu_architecture = "ARM64"
#     # }

#       # Container definition(s)
#       container_definitions = {

#         app-auth = {
#           cpu       = 512
#           memory    = 1024
#           essential = true
#           image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:auth"
#           port_mappings = [
#             {
#               name          = "app-auth"
#               containerPort = 3002
#               protocol      = "tcp"
#             }
#           ]

#           memory_reservation = 100
#         }

#         app-otp = {
#           cpu       = 512
#           memory    = 1024
#           essential = true
#           image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:otp"
#           port_mappings = [
#             {
#               name          = "app-otp"
#               containerPort = 3008
#               protocol      = "tcp"
#             }
#           ]

#           memory_reservation = 100
#         }

#         redis = {
#           cpu       = 512
#           memory    = 1024
#           essential = true
#           image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:redis"
#           port_mappings = [
#             {
#               name          = "redis"
#               containerPort = 3007
#               protocol      = "tcp"
#             }
#           ]

#           memory_reservation = 100
#         }

#         postgres = {
#           cpu       = 512
#           memory    = 1024
#           essential = true
#           image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:postgres"
#           port_mappings = [
#             {
#               name          = "postgres"
#               containerPort = 5432
#               protocol      = "tcp"
#             }
#           ],
#           environment = [
#             {
#               name  = "POSTGRES_USER"
#               value = "postgres"
#             },
#             {
#               name  = "POSTGRES_PASSWORD"
#               value = "password"
#             },
#             {
#               name  = "POSTGRES_DB"
#               value = "everyshillings"
#             }
#           ]
#           memory_reservation = 100
#         }

#         app-db = {
#           cpu       = 512
#           memory    = 1024
#           essential = true
#           image     = "540828511394.dkr.ecr.us-east-1.amazonaws.com/twala:db"
#           port_mappings = [
#             {
#               name          = "db"
#               containerPort = 3001
#               protocol      = "tcp"
#             }
#           ]
#           memory_reservation = 100
#         }

#       }
#       enable_cloudwatch_logging = false
#           log_configuration = {
#             logDriver = "awslogs"
#             options = {
#               awslogs-create-group= "true",
#               awslogs-group= "callums-node-logs",
#               awslogs-region= "us-east-1",
#               awslogs-stream-prefix= "awslogs-example"
#             }
#           },
#           memory_reservation = 100


#       subnet_ids = [ "subnet-0231d3bef9789ded7","subnet-03b3e5120c1f25884"]
#       security_group_rules = {
#         alb_ingress_3000 = {
#           type                     = "ingress"
#           from_port                = 80
#           to_port                  = 80
#           protocol                 = "tcp"
#           description              = "Service port"
#           # source_security_group_id = "sg-0a1f0a42a90de09bc"
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
#   }


# }




