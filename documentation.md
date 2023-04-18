## Summary
For the Infrastructure setup, l decided to use docker containers to reduce the stress of setting up Terraform on your local pc.

I also opted to use Codespace envronment for easy accessiblity of the IAM secret and access keys. A great starting point is to click the " Use this template button " for your setup

# COMMANDS TO RUN THE SETUP
Command to start the terraform docker container:

```
docker compose up -d
```
The service name is bash and to access the terraform platform we use:
```
docker compose exec tf bash
```

Running terraform commands :

```docker compose run --rm tf init
```

```docker compose run --rm tf fmt
```
```docker-compose run --rm tf validate
```

Also setup config files
nano ~/.aws/config

ssh-keygen
cat ./ssh/id_rsa.pub

sudo nano /etc/ssh/sshd_config


docker-compose run --rm tf plan -var-file=tfvars/dev.tfvars


aws configure --profile elcy-dev
docker run -d -it --name terraform-ubuntu ubuntu

~/.aws/credentials

Terraform init

Terrform plan -var-file=tfvars/dev.tfvars
-var-file=tfvars/dev.tfvars
Terraform apply

Terraform destroy -var-file=tfvars/dev.tfvars