#!/bin/bash

# Change to the directory containing your Terraform files
cd /backend-everyshilling-Terraform/terraform/

terraform init

terraform plan  -var-file=tfvars/dev.tfvars

# Apply the Terraform plan
terraform apply -var-file=tfvars/dev.tfvar

