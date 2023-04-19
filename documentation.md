## Summary
For the Infrastructure setup, l decided to use docker images and containers, to avoid directly installing terrafrom on your machine.

I also opted to use Codespace envronment for easy accessiblity and setup of AWS credentials.That is generated secret and access keys from my IAM user. I then exported these values in my codespace workspace before running terraform commands.

A great starting point would be clicking "Use this template button" found on the Repo for your initial setup.

# COMMANDS TO RUN THE SETUP
```docker-compose run --rm tf init
```

```docker compose run --rm tf fmt
```

```docker-compose run --rm tf validate
```

I also setup config files for the Terraform AWS Provider
Generating sshkey and storing in the AWS Console key pair
- Command to generate ssh key
```
ssh-keygen
cat ./ssh/id_rsa.pub




aws configure --profile elcy-dev
docker run -d -it --name terraform-ubuntu ubuntu