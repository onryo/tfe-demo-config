variable "branch" {
  description = "Git branch for code pull"
  default     = "master"
}

variable "terraform_version" {
  description = "Terraform version to use for runs"
}

variable "hostname" {
  description = "Terraform Enterprise host"
  default     = "app.terraform.io"
}

variable "token" {
  description = "Terraform Enterprise token"
}

variable "organization" {
  description = "Terraform Enterprise organization"
}

variable "oauth_token_id" {
  description = "Terraform Enterprise OAuth Token ID for VCS"
}

variable "owner" {
  description = "Owner tag to use for cloud instance tagging"
}

variable "ttl" {
  description = "TTL tag to use for cloud instance tagging"
}

variable "admin_password" {
  description = "Default admin password for Azure VM instances"
}

variable "arm_subscription_id" {
  description = "ARM Subscription ID"
}

variable "arm_client_id" {
  description = "ARM Client ID"
}

variable "arm_client_secret" {
  description = "ARM Client Secret"
}

variable "arm_tenant_id" {
  description = "ARM Tenant ID"
}

