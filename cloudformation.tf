resource "aws_cloudformation_stack" "ram_permission" {
  count = length(var.shared_accounts) == 0 ? 0 : 1
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
            ]
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
}