# provider "aws" {
#   region  = local.tf_workspace ? var.tags["region"] : local.tf_workspace_error
#   profile = format("%s", "default")
#   shared_credentials_files = ["~/.aws/credentials"]

#   default_tags {
#     tags = var.tags
#   }
# }

provider "aws" {
  region                  = var.tags["region"] != "" ? var.tags["region"] : local.tf_workspace_error
  profile                 = "default"
  shared_credentials_file = "~/.aws/credentials"

  default_tags {
    tags = var.tags
  }
}
