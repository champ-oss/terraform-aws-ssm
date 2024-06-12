# Create an advanced encrypted SSM parameter
module "this" {
  source     = "../../"
  git        = "terraform-aws-ssm"
  name       = "/terraform-aws-ssm/advanced"
  value      = "this is a test"
  enable_kms = true
  shared_accounts = []
}