output "arn" {
  description = "The ARN of the SSM parameter"
  value = try(aws_ssm_parameter.this[0].arn, null)
}

output "name" {
  description = "The name of the SSM parameter"
  value = try(aws_ssm_parameter.this[0].name, null)
}

output "kms_key_arn" {
  description = "The KMS key ARN used to encrypt the SSM parameter"
  value = try(module.kms[0].arn, null)
}

output "kms_key_id" {
  description = "The KMS key id used to encrypt the SSM parameter"
  value = try(module.kms[0].key_id, null)
}