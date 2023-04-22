## TO DO TASKS
- [x] Building and pushing the Docker images to Amazon ECR
- [x]
- [x] Deploying the Microservice using Terraform and ECR.
- [ ] Creating DNS Record for the Application Load Balancer's
- [ ] Testing the solution.

## Setting up the infrastructure

Requirements:
- AWS Account as user
- Terraform configured ( Could use the docker compose to set it up)
- AWS CLI installed and credentials configured.

 Click the 'Use this Template' button for your intial setup

 1. terraform init -var-file=tfvars/dev.tfvars
 2. terraform plan  -var-file=tfvars/dev.tfvars
 3. terraform apply -var-file=tfvars/dev.tfvars

To terminate the infrastructure
terraform destroy -var-file=tfvars/dev.tfvars

## To set up ansible:

Requirements:
- Python3
- Ansible
- AWS-CLI

sudo pip3 install ansible
sudo apt-get install awscli
aws configure --profile [your profile name]
sudo pip3 install boto (Boto Library)
sudo pip3 install boto3 (EC2plugin)
 Note; Sometimes ansible --version may return "module not found" SOLUTION: show path and add it to your environment
  ``` sudo pip3 show ansible ```
 ``` echo "export PATH=\$PATH:$(dirname $(sudo pip3 show ansible | grep Location | awk '{print $2}'))/bin" >> ~/.bashrc ```






Other stuff to Note:
- To generate keys
ssh-keygen
cat ~/.ssh/id_rsa.pub
aws configure --profile (set your profile)

- Incase faced with lock state key. [Solution](https://stackoverflow.com/questions/62189825/terraform-error-acquiring-the-state-lock-conditionalcheckfailedexception)

To check if ansible setting are being loaded :ansible-config view


ansible-inventory -i aws_ec2.yaml
ansible-inventory -i aws_ec2.yaml --list
ansible-inventory -i aws_ec2.yaml --graph
ansible-playbook -i aws-ec2.yaml playbook.yaml












### Others incase of setting up Terraform using Docker compose
```docker-compose up ```

```docker-compose run --rm tf init
```

```docker compose run --rm tf fmt
```

```docker-compose run --rm tf validate
```


docker run -d -it --name terraform-ubuntu ubuntu


