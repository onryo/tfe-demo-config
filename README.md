# tfe-demo-config

# Provision Terraform Enterprise demo workspaces
This Terraform configuration provisions the TFE demo workspaces for AWS, Azure, and GCP.


## Details
This Terraform configuration will bootstrap a TFE organization with all the necessary workspaces to do the standard SE demo. The initial runs may error due to the run kicking off before the variables can be populated.

## Variables

### TFE variables

* **terraform_version** - Terraform version to use for runs (default: 0.11.14)
* **hostname** - Terraform Enterprise host (default: app.terraform.io)
* **token** - Terraform Enterprise token
* **organization** - Terraform Enterprise organization
* **oauth_token_id** - Terraform Enterprise OAuth Token ID for VCS

### Cloud-agnostic variables

* **owner** - Owner tag to use for cloud instance tagging (default: george)
* **ttl** - TTL tag to use for cloud instance tagging (default: 8)
* **allowed_cidrs** - CIDR blocks to whitelist for cloud instances (default: ["207.108.217.224/28"])
* **admin_password** - Default admin password for cloud instances

### AWS variables

* **aws_access_key_id** - AWS Access Key ID
* **aws_secret_access_key** - AWS Secret Access Key

### Azure variables

* **arm_subscription_id** - ARM Subscription ID
* **arm_client_id** - ARM Client ID
* **arm_client_secret** - ARM Client Secret
* **arm_tenant_id** - ARM Tenant ID

### GCP variables

* **gcp_credentials** - GCP credentials
* **gcp_project** - GCP project name
