# Architectural Sample for the Docker swarm

![Docker swarm](/swarm/templates/Capture1.JPG)


## TO DO TASKS
- [x] Building and pushing the Docker images to Amazon ECR
- [x]Setting up infrastructure
- [x] Setting up pipeline
- [x] Ensuring all the services are up and running
- [x] Testing the solution.
- [ ] Creating DNS Record for the  Load Balancer's
- [] Setting up ssl security
- [] Monitoring and tracing

## Setting up the infrastructure

Requirements:
- AWS Account as user
- Terraform configured ( Could use the docker compose file to set it up)
- AWS CLI installed and credentials configured.
- Ansible setup

 Click the 'Use this Template' button for your initial setup

 To run the terraform files
 ```
terraform init
 ```
To set the resources to be provisioned use
``` terraform plan  -var-file=tfvars/dev.tfvars ```
 &&
``` terraform apply -var-file=tfvars/dev.tfvars ```

Doing terraform apply provisions the Docker Swarm resources, VPC with 3 instances (Worker and master)
The shell script install_dockercompose.sh installs docker and docker compose in your servers.

## Configuration Management

Ansible script responsible for creating the swarm cluster (a  manager and two worker node)

The inventory/hosts directory should be changed to the ec2 instances ip addresses to enable ssh.

 Playbook command:

 ```ansible-playbook -i inventory/hosts playbook.yml ```

## PIPELINES
.github workflow file is responsible for the autodeployment
- Once a PR is made , it builds images from the Makefile
- logins in to AWS ECR
- the build images are tagged and pushed to ecr
- then it deploys the docker stack



### AOB:

 1. terraform init -var-file=tfvars/dev.tfvars
 2. terraform plan  -var-file=tfvars/dev.tfvars
 3. terraform apply -var-file=tfvars/dev.tfvars

To terminate the infrastructure :
terraform destroy -var-file=tfvars/dev.tfvars


Note:
- To generate keys
ssh-keygen
cat ./ssh/id_rsa.pub
aws configure --profile (set your profile)

- Incase faced with lock state key. [Solution](https://stackoverflow.com/questions/62189825/terraform-error-acquiring-the-state-lock-conditionalcheckfailedexception)


















### Others incase of setting up Terraform using Docker compose
```docker-compose up ```

```docker-compose run --rm tf init
```

```docker compose run --rm tf fmt
```

```docker-compose run --rm tf validate
```


docker run -d -it --name terraform-ubuntu ubuntu


