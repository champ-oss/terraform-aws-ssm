variable "allow_external_principals" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share#allow_external_principals"
  type        = bool
  default     = false
}

variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-ssm"
}

variable "description" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter#description"
  type        = string
  default     = null
}

variable "enable_kms" {
  description = "Create an use a KMS key to encrypt the SSM parameter"
  type        = bool
  default     = false
}

variable "enable_resources" {
  description = "Enable the creation of resources"
  type        = bool
  default     = true
}

variable "enable_random_name_suffix" {
  description = "Add a random ID to the end of the parameter name"
  type        = bool
  default     = true
}

variable "kms_deletion_window_in_days" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#deletion_window_in_days"
  type        = number
  default     = 30
}

variable "name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter#name"
  type        = string
}

variable "shared_accounts" {
  description = "AWS accounts to share the SSM parameter"
  type        = list(string)
  default     = []
}

variable "shared_principal_arns" {
  description = "AWS principal ARN patterns to share the SSM parameter"
  type        = list(string)
  default     = ["*"]
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "tier" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter#tier"
  type        = string
  default     = "Advanced"
}

variable "type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter#type"
  type        = string
  default     = "SecureString"
}

variable "value" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter#value"
  type        = string
}

variable "enable_ram_permission" {
  description = "Enable the creation of RAM permissions"
  type        = bool
  default     = false
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}
