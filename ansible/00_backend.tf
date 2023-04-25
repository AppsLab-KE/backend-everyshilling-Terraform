terraform {
  backend "s3" {
    bucket                  = "everyshilling-tfstate"
    key                     = "everyshilling.tfstate"
    workspace_key_prefix    = "workspaces"
    region                  = "us-east-1"
    encrypt                 = true
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "default"
  }
}