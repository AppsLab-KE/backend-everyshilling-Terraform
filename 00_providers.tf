provider "aws" {
  region  = local.tf_workspace ? var.tags["region"] : local.tf_workspace_error
  profile = format("elcy-%s", var.tags["environment"])

  default_tags {
    tags = var.tags
  }
}