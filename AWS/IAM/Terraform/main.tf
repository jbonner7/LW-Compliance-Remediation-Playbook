#SCP to prevent recurring or future root account abuse"

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

resource "aws_organizations_policy" "scp" {
  name = "scp_root_account"
  description = "Service Control Policy that restricts the root user in an AWS account from taking any action, either directly as a command or through the console."
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "StringLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:root"
          ]
        }
      }
    }
  ]
}
POLICY

}

