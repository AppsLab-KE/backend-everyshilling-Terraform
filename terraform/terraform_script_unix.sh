#!/bin/bash
# Change to the directory containing your Terraform files
# cd /backend-everyshilling-Terraform/terraform/
terraform init

terraform plan  -var-file=tfvars/dev.tfvars

terraform apply  -var-file=tfvars/dev.tfvars

