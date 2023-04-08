terraform {
  backend "s3" {
    bucket                  = "everyshilling-sample-tfstate"
    key                     = "sample_eveyshilling.tfstate"
    dynamodb_table          = "everyshilling"
    workspace_key_prefix    = "workspaces"
    region                  = "us-east-1"
    encrypt                 = true
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "elcy-dev"
  }
}