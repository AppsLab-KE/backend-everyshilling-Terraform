
data "aws_region" "current" {}

locals {
  region             = data.aws_region.current.name != "us-east-1" ? false : true
  tf_workspace       = terraform.workspace == var.tags["environment"] ? true : false
  tf_workspace_error = "Selected workspace is incorrect!"
}