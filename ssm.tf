resource "aws_ssm_parameter" "this" {
  count       = var.enable_resources && var.enabled ? 1 : 0
  name        = var.enable_random_name_suffix ? "${var.name}-${random_string.identifier[0].result}" : var.name
  description = var.description != null ? var.description : var.git
  type        = var.type
  value       = var.value
  tags        = merge(local.tags, var.tags)
  key_id      = var.enable_kms ? module.kms[0].key_id : null
  tier        = var.tier

  lifecycle {
    ignore_changes = [name]
  }
}

