## Summary
For the Infrastructure setup, l decided to use docker images and containers, to avoid directly installing terrafrom on your machine.

I also opted to use Codespace envronment for easy accessiblity and setup of AWS credentials.That is generated secret and access keys from my IAM user. I then exported these values in my codespace workspace before running terraform commands.

A great starting point would be clicking "Use this template button" found on the Repo for your initial setup.


## How to set up the infrastructure ?

Requirements:
- AWS Account as user 
- Terraform configured ( Could use the docker compose to set it up)
- AWS CLI installed and credentials configured.

 Click the 'Use this Template' button for your intial setup 
 
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


