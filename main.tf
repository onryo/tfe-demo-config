provider "tfe" {
  hostname = "${var.hostname}"
  token    = "${var.token}"
}

# AWS Demo Environment

module "aws-ec2-instance-dev" {
  source = "./modules/aws-ec2-instance"

  branch                = "dev"
  terraform_version     = "${var.terraform_version}"
  token                 = "${var.token}"
  organization          = "${var.organization}"
  oauth_token_id        = "${var.oauth_token_id}"
  owner                 = "${var.owner}"
  ttl                   = "${var.ttl}"
  allowed_cidrs         = "${var.allowed_cidrs}"
  aws_access_key_id     = "${var.aws_access_key_id}"
  aws_secret_access_key = "${var.aws_secret_access_key}"
}

module "aws-ec2-instance-prod" {
  source = "./modules/aws-ec2-instance"

  branch                = "prod"
  terraform_version     = "${var.terraform_version}"
  token                 = "${var.token}"
  organization          = "${var.organization}"
  oauth_token_id        = "${var.oauth_token_id}"
  owner                 = "${var.owner}"
  ttl                   = "${var.ttl}"
  allowed_cidrs         = "${var.allowed_cidrs}"
  aws_access_key_id     = "${var.aws_access_key_id}"
  aws_secret_access_key = "${var.aws_secret_access_key}"
}

resource "tfe_policy_set" "aws" {
  name         = "AWS"
  description  = "AWS-related policies"
  organization = "${var.organization}"
  depends_on   = ["module.aws-ec2-instance-dev", "module.aws-ec2-instance-prod"]

  policy_ids = [
    "${tfe_sentinel_policy.restrict-aws-availability-zones.id}",
    "${tfe_sentinel_policy.restrict-aws-instance-type.id}",
  ]

  workspace_external_ids = [
    "${module.aws-ec2-instance-dev.tfe_workspace_external_id}",
    "${module.aws-ec2-instance-prod.tfe_workspace_external_id}",
  ]
}

data "template_file" "restrict-aws-availability-zones" {
  template = "${file("./sentinel/restrict-aws-availability-zones.sentinel")}"
}

data "template_file" "restrict-aws-instance-type" {
  template = "${file("./sentinel/restrict-aws-instance-type.sentinel")}"
}

resource "tfe_sentinel_policy" "restrict-aws-availability-zones" {
  name         = "restrict-aws-availability-zones"
  description  = "Restrict which AWS availability zones can be used for EC2 deployments"
  organization = "${var.organization}"
  policy       = "${data.template_file.restrict-aws-availability-zones.rendered}"
  enforce_mode = "hard-mandatory"
}

resource "tfe_sentinel_policy" "restrict-aws-instance-type" {
  name         = "restrict-aws-instance-type"
  description  = "Policy to restrict the available AWS EC2 instance types"
  organization = "${var.organization}"
  policy       = "${data.template_file.restrict-aws-instance-type.rendered}"
  enforce_mode = "soft-mandatory"
}

# Azure Demo Environment

module "azure-vm-from-module" {
  source = "./modules/azure-vm-from-module"

  terraform_version   = "${var.terraform_version}"
  token               = "${var.token}"
  organization        = "${var.organization}"
  oauth_token_id      = "${var.oauth_token_id}"
  owner               = "${var.owner}"
  ttl                 = "${var.ttl}"
  admin_password      = "${var.admin_password}"
  arm_subscription_id = "${var.arm_subscription_id}"
  arm_client_id       = "${var.arm_client_id}"
  arm_client_secret   = "${var.arm_client_secret}"
  arm_tenant_id       = "${var.arm_tenant_id}"
}

resource "tfe_policy_set" "azure" {
  name         = "Azure"
  description  = "Azure-related policies"
  organization = "${var.organization}"
  depends_on   = ["module.azure-vm-from-module"]

  policy_ids             = ["${tfe_sentinel_policy.restrict-vm-publisher.id}"]
  workspace_external_ids = ["${module.azure-vm-from-module.tfe_workspace_external_id}"]
}

data "template_file" "restrict-vm-publisher" {
  template = "${file("./sentinel/restrict-vm-publisher.sentinel")}"
}

resource "tfe_sentinel_policy" "restrict-vm-publisher" {
  name         = "restrict-vm-publisher"
  description  = "Policy to restrict available Azure VM instances to a subset of sanctioned publishers"
  organization = "${var.organization}"
  policy       = "${data.template_file.restrict-vm-publisher.rendered}"
  enforce_mode = "soft-mandatory"
}

# GCP Demo Environment

module "gcp-compute-instance" {
  source = "./modules/gcp-compute-instance"

  terraform_version   = "${var.terraform_version}"
  token               = "${var.token}"
  organization        = "${var.organization}"
  oauth_token_id      = "${var.oauth_token_id}"
  gcp_credentials     = "${var.gcp_credentials}"
  gcp_project         = "${var.gcp_project}"
}

resource "tfe_policy_set" "gcp" {
  name         = "GCP"
  description  = "GCP-related policies"
  organization = "${var.organization}"
  depends_on   = ["module.gcp-compute-instance"]

  policy_ids             = ["${tfe_sentinel_policy.restrict-gcp-machine-type.id}"]
  workspace_external_ids = ["${module.gcp-compute-instance.tfe_workspace_external_id}"]
}

data "template_file" "restrict-gcp-machine-type" {
  template = "${file("./sentinel/restrict-gcp-machine-type.sentinel")}"
}

resource "tfe_sentinel_policy" "restrict-gcp-machine-type" {
  name         = "restrict-gcp-machine-type"
  description  = "Policy to restrict available Azure VM instances to a subset of sanctioned publishers"
  organization = "${var.organization}"
  policy       = "${data.template_file.restrict-gcp-machine-type.rendered}"
  enforce_mode = "soft-mandatory"
}
