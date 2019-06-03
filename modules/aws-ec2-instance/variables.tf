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

variable "allowed_cidrs" {
  description = "CIDR blocks to whitelist for cloud instances"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
}

