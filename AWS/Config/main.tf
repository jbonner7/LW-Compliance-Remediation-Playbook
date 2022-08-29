terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}


provider "aws" {
}

resource "aws_organizations_policy" "scp" {
  name = "scp_config"
  description = "This SCP prevents users or roles in any affected account from running AWS Config operations that could disable AWS Config or alter its rules or triggers. "
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "config:DeleteConfigRule",
        "config:DeleteConfigurationRecorder",
        "config:DeleteDeliveryChannel",
        "config:StopConfigurationRecorder"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}
