# Create an advanced encrypted SSM parameter
module "this" {
  source          = "../../"
  git             = "terraform-aws-ssm"
  name            = "/terraform-aws-ssm/advanced"
  value           = "this is a test"
  enable_kms      = true
  shared_accounts       = ["123456789012"]
  shared_principal_arns = [
    "arn:aws:iam::123456789012:role/aws-reserved/sso.amazonaws.com/us-east-2/AWSReservedSSO_admin*"
  ]
}