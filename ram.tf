resource "aws_ram_resource_share" "this" {
  count                     = length(var.shared_accounts) == 0 && !var.enabled ? 0 : 1
  name                      = "${var.git}-ssm-${random_string.identifier[0].result}"
  allow_external_principals = var.allow_external_principals
  permission_arns           = var.enable_ram_permission ? [aws_cloudformation_stack.ram_permission[0].outputs["RamPermissionArn"]] : []
  tags                      = merge(local.tags, var.tags)
}

resource "aws_ram_principal_association" "this" {
  for_each           = toset(var.shared_accounts)
  principal          = each.value
  resource_share_arn = aws_ram_resource_share.this[0].arn
}

resource "aws_ram_resource_association" "this" {
  count              = length(var.shared_accounts) == 0 && !var.enabled ? 0 : 1
  resource_arn       = aws_ssm_parameter.this[0].arn
  resource_share_arn = aws_ram_resource_share.this[0].arn
}
