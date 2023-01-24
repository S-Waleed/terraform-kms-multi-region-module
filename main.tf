resource "aws_kms_key" "primary" {
  multi_region             = true
  description              = var.description
  customer_master_key_spec = var.key_spec
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.rotation_enabled
  policy                   = var.primary_key_policy
  deletion_window_in_days  = var.deletion_window_in_days

  tags = merge(
    var.tags,
    {
      "Multi-Region" = "true",
      "Primary"      = "true"
    }
  )
}

# Add an alias to the primary key
resource "aws_kms_alias" "primary" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.primary.key_id
}

# First replica
# Create the replica key using the primary's arn.
resource "aws_kms_replica_key" "first_replica" {
  provider = aws.first_replica

  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  primary_key_arn         = aws_kms_key.primary.arn
  policy                  = var.replica.first_key_policy

  tags = merge(
    var.tags,
    {
      "Multi-Region" = "true",
      "Primary"      = "false"
    }
  )
}

# Add an alias to the replica key
resource "aws_kms_alias" "first_replica" {
  provider = aws.first_replica

  name          = "alias/${var.alias}"
  target_key_id = aws_kms_replica_key.first_replica.key_id
}

# Second replica
# Create the replica key using the primary's arn.
resource "aws_kms_replica_key" "second_replica" {
  provider = aws.second_replica

  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  primary_key_arn         = aws_kms_key.primary.arn
  policy                  = var.replica.second_key_policy

  tags = merge(
    var.tags,
    {
      "Multi-Region" = "true",
      "Primary"      = "false"
    }
  )
}

# Add an alias to the replica key
resource "aws_kms_alias" "second_replica" {
  provider = aws.second_replica

  name          = "alias/${var.alias}"
  target_key_id = aws_kms_replica_key.second_replica.key_id
}
