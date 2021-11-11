variable "description" {
  type        = string
  description = "The description of the key as viewed in AWS console."
}

variable "key_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1"
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the key is enabled."
}

variable "rotation_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the key."
}

variable "alias" {
  type        = string
  description = "The display name of the key."
}

variable "primary_key_policy" {
  type        = string
  description = "(Required) The key policy to attach to the primary KMS key."
}

variable "replica_key_policy" {
  type        = string
  description = "(Required) The key policy to attach to the replica KMS key."
}

variable "replica_region" {
  type        = string
  description = "(required) The replica region for the KMS key."
}

variable "deletion_window_in_days" {
  type        = number
  description = "(optional) The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30."
  default     = 30
}
