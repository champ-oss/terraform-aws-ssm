module "this" {
  source = "../../"
  git    = "terraform-aws-ssm"
  name   = "/terraform-aws-ssm/standard"
  value  = "this is a test"
}

output "outputs" {
  value = module.this
}
