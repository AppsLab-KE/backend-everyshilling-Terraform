## Summary
For the Infrastructure setup, l decided to use docker containers to reduce the stress of setting up Terraform on your local pc.

I also opted to use Codespace envronment for easy accessiblity of the IAM secret and access keys. A great starting point is to click the " Use this template button " for your setup

# COMMANDS TO RUN THE SETUP
```docker-compose run --rm tf init
```

```docker-compose run --rm tf fmt
```
```docker-compose run --rm tf validate
```

Also setup config files
nano ~/.aws/config

ssh-keygen
cat ./ssh/id_rsa.pub


docker-compose run --rm tf plan -var-file=tfvars/dev.tfvars