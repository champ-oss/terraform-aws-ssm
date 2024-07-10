module "kms" {
  count                   = var.enable_kms ? 1 : 0
  source                  = "github.com/champ-oss/terraform-aws-kms.git?ref=v1.0.34-a5b529e"
  git                     = var.git
  name                    = "alias/${var.git}-ssm-${random_string.identifier[0].result}"
  deletion_window_in_days = var.kms_deletion_window_in_days
  account_actions = [
    for shared_account in var.shared_accounts : {
      account = shared_account
      actions = ["kms:Decrypt"]
    }
  ]
  tags    = merge(local.tags, var.tags)
  enabled = var.enable_kms
}
