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

variable "gcp_credentials" {
  description = "GCP credentials"
}

variable "gcp_project" {
  description = "GCP project name"
}

