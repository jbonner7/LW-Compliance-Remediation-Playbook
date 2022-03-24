terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

provider "aws" {
  # Configuration options
resource "aws_organizations_policy" "s3_scp_bucket_encryption" {
  name = "s3_scp_bucket_encryption"
  content = <<CONTENT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:PutObject"
            ],
            "Resource": "*",
            "Effect": "Deny",
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption": "AES256"
                }
            }
        },
        {
            "Action": [
                "s3:PutObject"
            ],
            "Resource": "*",
            "Effect": "Deny",
            "Condition": {
                "Bool": {
                    "s3:x-amz-server-side-encryption": false
                }
            }
        }
    ]
  } 
 }
}
