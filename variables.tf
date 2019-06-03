# TFE variables

variable "terraform_version" {
  description = "Terraform version to use for runs"
  default     = "0.11.14"
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

# Cloud-agnostic variables

variable "owner" {
  description = "Owner tag to use for cloud instance tagging"
  default     = "george"
}

variable "ttl" {
  description = "TTL tag to use for cloud instance tagging"
  default     = "8"
}

variable "allowed_cidrs" {
  description = "CIDR blocks to whitelist for cloud instances"
  default     = "[\"207.108.217.224/28\"]"
}

variable "admin_password" {
  description = "Default admin password for cloud instances"
}

# AWS variables

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
}

# Azure variables

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

# GCP variables

variable "gcp_credentials" {
  description = "GCP credentials"
}

variable "gcp_project" {
  description = "GCP project name"
}

