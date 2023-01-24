# KMS

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_key"></a> [s3\_key](#module\_s3\_key) | ../terraform-kms-multi-region-module | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.first_replica](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.primary](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.second_replica](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Account ID number of the account. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region. | `string` | n/a | yes |
| <a name="input_replica"></a> [replica](#input\_replica) | (optional) describe your variable | <pre>object({<br>    first_region      = string<br>    first_account_id  = string<br>    second_region     = string<br>    second_account_id = string<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Author

Waleed from <https://cloudly.engineer>
