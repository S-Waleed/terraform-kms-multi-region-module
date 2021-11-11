output "key_arn" {
  value       = aws_kms_key.primary.arn
  description = "The Amazon Resource Name (ARN) of the key."
}
