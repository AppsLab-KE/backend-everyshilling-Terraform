provider "aws" {
  region  = local.tf_workspace ? var.tags["region"] : local.tf_workspace_error
  profile = format("elcy-%s", var.tags["environment"])
  shared_credentials_files = ["~/.aws/credentials"]

  default_tags {
    tags = var.tags
  }
}