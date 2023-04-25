resource "aws_cloudwatch_log_group" "log-group" {
    name = format("%s-dev",var.log-group)

  tags = {
    project_owner = "AppsLab"
  }
}