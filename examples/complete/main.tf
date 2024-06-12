terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.30.0"
    }
  }
}

# Create a standard encrypted SSM parameter
module "this" {
  source = "../../"
  git    = "terraform-aws-ssm"
  name   = "/terraform-aws-ssm/standard"
}