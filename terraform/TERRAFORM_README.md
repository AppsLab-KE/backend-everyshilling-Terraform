## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.62.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.master_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.worker_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_network_acl.my_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl_rule.ssh_ingress_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_route_table.rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.my_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.sbnt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.my_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | AMI ID for the EC2 instances | `string` | `"i-092e94a912388140d"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for EC2 instances | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the key pair for SSH access | `any` | n/a | yes |
| <a name="input_my_internet_gateway"></a> [my\_internet\_gateway](#input\_my\_internet\_gateway) | internet gateway used in vpc | `any` | n/a | yes |
| <a name="input_my_vpc"></a> [my\_vpc](#input\_my\_vpc) | vpc creation | `any` | n/a | yes |
| <a name="input_nat_gateway_route"></a> [nat\_gateway\_route](#input\_nat\_gateway\_route) | NAT gateway value | `any` | n/a | yes |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | Name of the security group | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the subnet to launch the instances in | `any` | n/a | yes |
| <a name="input_subnets_cidr"></a> [subnets\_cidr](#input\_subnets\_cidr) | vpc subnets cidr | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_master_private_ip"></a> [master\_private\_ip](#output\_master\_private\_ip) | n/a |
| <a name="output_master_public_ip"></a> [master\_public\_ip](#output\_master\_public\_ip) | n/a |
| <a name="output_worker1_public_ip"></a> [worker1\_public\_ip](#output\_worker1\_public\_ip) | n/a |
