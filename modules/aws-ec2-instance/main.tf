provider "tfe" {
  hostname = "${var.hostname}"
  token    = "${var.token}"
}

# AWS EC2 Instance Demo workspace config

resource "tfe_workspace" "aws-ec2-instance" {
  name              = "aws-ec2-instance-${var.branch}"
  organization      = "${var.organization}"
  terraform_version = "${var.terraform_version}"

  vcs_repo {
    identifier     = "onryo/tfe-demo-aws-ec2-instance"
    branch         = "${var.branch}"
    oauth_token_id = "${var.oauth_token_id}"
  }
}

resource "tfe_variable" "aws-ec2-instance_name" {
  key          = "name"
  value        = "george-tfe-demo-${var.branch}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}

resource "tfe_variable" "aws-ec2-instance_owner" {
  key          = "owner"
  value        = "${var.owner}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}

resource "tfe_variable" "aws-ec2-instance-ttl" {
  key          = "ttl"
  value        = "${var.ttl}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}

resource "tfe_variable" "aws-ec2-instance_key_name" {
  key          = "key_name"
  value        = "${var.owner}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}

resource "tfe_variable" "aws-ec2-instance_allowed_cidrs" {
  key          = "allowed_cidrs"
  value        = "${var.allowed_cidrs}"
  hcl          = true
  category     = "terraform"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}

resource "tfe_variable" "aws-ec2-instance_aws_access_key_id" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = "${var.aws_access_key_id}"
  sensitive    = true
  category     = "env"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}

resource "tfe_variable" "aws-ec2-instance_aws_secret_access_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = "${var.aws_secret_access_key}"
  sensitive    = true
  category     = "env"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}

resource "tfe_variable" "aws-ec2-instance_confirm_destroy" {
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${tfe_workspace.aws-ec2-instance.id}"
}
