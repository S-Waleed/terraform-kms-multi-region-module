# AWS KMS Terraform Module

A Terraform module that creates multi-region KMS keys and the key alias resources on AWS Cloud.

AWS Key Management Service (KMS) allows you to create and manage cryptographic keys that you can use to encrypt and decrypt data. One of the key features of KMS is the ability to create and manage keys across multiple regions.

There are several benefits to using multi-region KMS keys:

* Redundancy: By creating a key in multiple regions, you can ensure that you have a backup key available in case one region becomes unavailable.
* Latency: By creating a key in the region closest to your users, you can reduce the latency of cryptographic operations.
* Compliance: Some compliance requirements mandate that cryptographic keys must be stored in specific regions. By creating keys in multiple regions, you can ensure that you are compliant with these requirements.

Once the key is created, you can use it to encrypt and decrypt data in any of the specified regions.

It's important to note that multi-region KMS keys are regional resources, which means that each region has its own version of the key. This means that the key material, policies, and metadata for the key may be different in each region.

## Usage

See the [example](examples/) directory.

## Limitations

* This module can replicate the KMS key to only two regions.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.64.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.64.2 |
| <a name="provider_aws.first_replica"></a> [aws.first\_replica](#provider\_aws.first\_replica) | >= 3.64.2 |
| <a name="provider_aws.second_replica"></a> [aws.second\_replica](#provider\_aws.second\_replica) | >= 3.64.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.first_replica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_alias.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_alias.second_replica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_replica_key.first_replica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_replica_key) | resource |
| [aws_kms_replica_key.second_replica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_replica_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | The display name of the key. | `string` | n/a | yes |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | (optional) The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. | `number` | `30` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the key as viewed in AWS console. | `string` | n/a | yes |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Specifies whether the key is enabled. | `bool` | `true` | no |
| <a name="input_key_spec"></a> [key\_spec](#input\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1 | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_replica"></a> [replica](#input\_replica) | (optional) describe your variable | <pre>object({<br>    first_region      = string<br>    first_key_policy  = string<br>    second_region     = string<br>    second_key_policy = string<br>  })</pre> | n/a | yes |
| <a name="input_rotation_enabled"></a> [rotation\_enabled](#input\_rotation\_enabled) | Specifies whether key rotation is enabled. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the key. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | The Amazon Resource Name (ARN) of the key. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Author

Module is maintained by [Waleed](https://cloudly.engineer). Here's a [blog link](https://cloudly.engineer/2021/terraform-aws-kms-multi-region-keys/aws/) about it.

## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
