module "this" {
  source = "../../"
  git    = "terraform-aws-ssm"
  name   = "/terraform-aws-ssm/standard"
  value  = "this is a test"
}

module "disabled" {
  source           = "../../"
  git              = "terraform-aws-ssm"
  name             = "/terraform-aws-ssm/standard"
  value            = "this is a test"
  enable_resources = false
}

output "outputs" {
  value = module.this
}

output "disabled" {
  value = module.disabled
}