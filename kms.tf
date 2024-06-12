module "kms" {
  count                   = var.enable_kms ? 1 : 0
  source                  = "github.com/champ-oss/terraform-aws-kms.git?ref=v1.0.33-cb3be31"
  git                     = var.git
  name                    = "alias/${var.git}-ssm-${random_string.identifier.result}"
  deletion_window_in_days = var.kms_deletion_window_in_days
  account_actions         = []
  tags                    = merge(local.tags, var.tags)
}