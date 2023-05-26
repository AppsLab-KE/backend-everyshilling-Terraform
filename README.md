# Architectural Sample for Infarustructure Provisioning

![Docker swarm](templates/Capture.JPG)

Requirements:
- AWS Account as user
- Terraform configured ( Could use the docker compose file to set it up)
- AWS CLI installed and credentials configured.
- Ansible setup


## SETUP
TO DO TASKS

- [x] Building and pushing the Docker images to Amazon ECR
- [x] Setting up Infrastructure
- [x] Setting up  CICD pipeline
- [x] Ensuring all the services are up and running
- [x] Testing the solution.
-  Creating DNS Record for the  Load Balancer's
- Setting up ssl security
- Monitoring and tracing

 Click the 'Use this Template' button for your initial setup

## Setting up the infrastructure

Terraform Readme is located at [terraform/TERRAFORM_README.md](terraform/TERRAFORM_README.md)


### To run all the Terraform commands at once

Make the file terraform_script.sh file executable ('chmod +x terraform_script.sh') and execute it by running:

```
./terraform_script.sh
```

 This provisions the infrastructure for the first time,and from the output copy those ip addresses key to the hosts file under inventoy directory.[inventory]()


 Once all the configurations is set,run the terraform script again ```./terraform_script.sh ``` then this command from the ansible playbook which deploys the cluster

 ```
ansible-playbook -i inventory/hosts playbook.yml
 ```

The swarm cluster should now be ready.To chck the cluster using ssh in manager node:

```
ssh -i your_key_file.pem ubuntu@manager_public_ip
sudo docker node ls`

```


### BLABLABLA

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

Ansible script responsible for creating the swarm cluster (a manager and two worker node)

The inventory/hosts directory should be changed to the ec2 instances ip addresses to enable ssh.

 Playbook command:

 ```
 ansible-playbook -i inventory/hosts playbook.yml
 ```



### AOB:

 1. terraform init
 2. terraform plan  -var-file=tfvars/dev.tfvars
 3. terraform apply -var-file=tfvars/dev.tfvar

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


