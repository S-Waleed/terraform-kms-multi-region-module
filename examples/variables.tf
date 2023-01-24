variable "region" {
  type        = string
  description = "The AWS region."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "account_id" {
  type        = string
  description = "AWS Account ID number of the account."
}

variable "replica" {
  type = object({
    first_region      = string
    first_account_id  = string
    second_region     = string
    second_account_id = string
  })
  description = "(optional) describe your variable"
}
