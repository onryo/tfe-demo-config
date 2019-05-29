provider "tfe" {
  hostname = "${var.hostname}"
  token    = "${var.token}"
}

# Azure VM Instance Demo workspace config

resource "tfe_workspace" "azure-vm-from-module" {
  name              = "azure-vm-from-module"
  organization      = "${var.organization}"
  terraform_version = "${var.terraform_version}"

  vcs_repo {
    identifier     = "onryo/tfe-demo-azure-vm-from-module"
    branch         = "${var.branch}"
    oauth_token_id = "${var.oauth_token_id}"
  }
}

resource "tfe_variable" "azure-vm-from-module_name_prefix" {
  key          = "name_prefix"
  value        = "${var.owner}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_admin_password" {
  key          = "admin_password"
  value        = "${var.admin_password}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_owner" {
  key          = "owner"
  value        = "${var.owner}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_ttl" {
  key          = "ttl"
  value        = "${var.ttl}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_arm_subscription_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = "${var.arm_subscription_id}"
  sensitive    = true
  category     = "env"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_arm_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = "${var.arm_client_id}"
  sensitive    = true
  category     = "env"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_arm_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = "${var.arm_client_secret}"
  sensitive    = true
  category     = "env"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_arm_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = "${var.arm_tenant_id}"
  sensitive    = true
  category     = "env"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}

resource "tfe_variable" "azure-vm-from-module_confirm_destroy" {
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${tfe_workspace.azure-vm-from-module.id}"
}
