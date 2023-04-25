resource "aws_ecs_cluster" "ecs_cluster" {
  name = format("%s-dev",var.ecs_cluster_name)
}