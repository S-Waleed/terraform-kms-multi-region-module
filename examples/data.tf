data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "primary" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }

  statement {
    sid    = "Allow access for Key Administrators"
    effect = "Allow"
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:role/${local.role_name}"
      ]
    }
  }

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:role/${local.role_name}"
      ]
    }
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:role/${local.role_name}"
      ]
    }

    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
}

data "aws_iam_policy_document" "first_replica" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${var.replica.first_account_id}:root"]
    }
  }

  statement {
    sid    = "Allow access for Key Administrators"
    effect = "Allow"
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.first_account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.first_account_id}:role/${local.role_name}"
      ]
    }
  }

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.first_account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.first_account_id}:role/${local.role_name}"
      ]
    }
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.first_account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.first_account_id}:role/${local.role_name}"
      ]
    }

    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
}

data "aws_iam_policy_document" "second_replica" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${var.replica.second_account_id}:root"]
    }
  }

  statement {
    sid    = "Allow access for Key Administrators"
    effect = "Allow"
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.second_account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.second_account_id}:role/${local.role_name}"
      ]
    }
  }

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.second_account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.second_account_id}:role/${local.role_name}"
      ]
    }
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.second_account_id}:user/${local.admin_username}",
        "arn:${data.aws_partition.current.partition}:iam::${var.replica.second_account_id}:role/${local.role_name}"
      ]
    }

    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
}
