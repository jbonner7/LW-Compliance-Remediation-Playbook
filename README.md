# LW_Compliance_Remediation_Playbook
Repository of terraform modules, cloudformation files, & python scripts to help with org level CIS compliance. The terraform module (where applicable) creates a service control policy to prevent the violation from re-occurring. A Boto3 script is provided to correct existing violations (where inline changes are permitted). Where possible, a Lacework LQL query can be used to identify existing violations using the Lacework CLI. 

Using any of the scripts in this repository may require you to download and install one or all of the below software applications:

***Install the Lacework CLI (https://www.lacework.com/blog/running-with-lacework-cli/)

***Install the AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

***Install Terraform (https://learn.hashicorp.com/tutorials/terraform/install-cli)

***Install python (https://www.python.org/downloads/)
