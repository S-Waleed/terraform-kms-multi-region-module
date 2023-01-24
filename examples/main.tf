locals {
  admin_username = "break-glass-user"
  role_name      = "svc-terraform-role"
}

module "s3_key" {
  source = "../../terraform-kms-multi-region-module"

  description        = "KMS key for S3 objects."
  alias              = "multi-region-s3-key"
  primary_key_policy = data.aws_iam_policy_document.primary.json

  replica = {
    first_key_policy  = data.aws_iam_policy_document.first_replica.json
    first_region      = var.replica.first_region
    second_key_policy = data.aws_iam_policy_document.second_replica.json
    second_region     = var.replica.second_region
  }

  tags = {
    Name = "multi-region-s3"
  }
}
