provider "aws" {
  alias  = "first_replica"
  region = var.replica.first_region
}

provider "aws" {
  alias  = "second_replica"
  region = var.replica.second_region
}
