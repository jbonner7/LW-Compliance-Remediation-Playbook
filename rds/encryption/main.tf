# prevents Aurora and non-aurora RDS instances from being launched without encryption enabled

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
resource "aws_organizations_policy" "rds_scp_db_encryption" {
  name = "rds_scp_db_encryption"
  content = <<CONTENT

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "NonAuroraRDS",
            "Effect": "Deny",
            "Action": [
                "rds:CreateDBInstance"
            ],
            "Resource": [
                "*"
            ],
            "Condition": {
                "ForAnyValue:StringEquals": {
                    "rds:DatabaseEngine": [
                        "mariadb",
                        "mysql",
                        "oracle-ee",
                        "oracle-se2",
                        "oracle-se1",
                        "oracle-se",
                        "postgres",
                        "sqlserver-ee",
                        "sqlserver-se",
                        "sqlserver-ex",
                        "sqlserver-web"
                    ]
                },
                "Bool": {
                    "rds:StorageEncrypted": "false"
                }
            }
        },
        {
            "Sid": "AuroraRDS",
            "Effect": "Deny",
            "Action": [
                "rds:CreateDBCluster"
            ],
            "Resource": [
                "*"
            ],
            "Condition": {
                "Bool": {
                    "rds:StorageEncrypted": "false"
                }
            }
          } 
        ]  
      }
   } 
}
