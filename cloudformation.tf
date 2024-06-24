resource "terraform_data" "shared_principal_arns" {
  input = var.shared_principal_arns
}

# There is not currently a Terraform resource for a RAM permission
resource "aws_cloudformation_stack" "ram_permission" {
  count = var.enable_ram_permission ? 1 : 0
  name  = "${var.git}-ssm-${random_string.identifier.result}"

  template_body = jsonencode({
    Resources = {
      RamPermission = {
        Type = "AWS::RAM::Permission"
        Properties = {
          Name         = "${var.git}-ssm-${random_string.identifier.result}"
          ResourceType = "ssm:Parameter"
          PolicyTemplate = {
            "Effect" : "Allow",
            "Action" : [
              "ssm:DescribeParameters",
              "ssm:GetParameter",
              "ssm:GetParameters"
            ],
            "Condition" : {
              "StringLike" : {
                "aws:PrincipalArn" : var.shared_principal_arns
              }
            }
          }
        }
      }
    },
    Outputs = {
      RamPermissionArn = {
        Description : "RAM Permission ARN"
        Value : { "Fn::GetAtt" : "RamPermission.Arn" }
      },
    }
  })

  lifecycle {
    replace_triggered_by = [terraform_data.shared_principal_arns]
  }
}
