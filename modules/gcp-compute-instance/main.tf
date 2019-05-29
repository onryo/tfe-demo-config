provider "tfe" {
  hostname = "${var.hostname}"
  token    = "${var.token}"
}

# Azure VM Instance Demo workspace config

resource "tfe_workspace" "gcp-compute-instance" {
  name              = "gcp-compute-instance"
  organization      = "${var.organization}"
  terraform_version = "${var.terraform_version}"

  vcs_repo {
    identifier     = "onryo/tfe-demo-gcp-compute-instance"
    branch         = "${var.branch}"
    oauth_token_id = "${var.oauth_token_id}"
  }
}

resource "tfe_variable" "gcp-compute-instance_gcp_credentials" {
  key          = "gcp_credentials"
  value        = "${var.gcp_credentials}"
  category     = "terraform"
  sensitive    = true
  workspace_id = "${tfe_workspace.gcp-compute-instance.id}"
}

resource "tfe_variable" "gcp-compute-instance_gcp_project" {
  key          = "gcp_project"
  value        = "${var.gcp_project}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.gcp-compute-instance.id}"
}

resource "tfe_variable" "gcp-compute-instance_confirm_destroy" {
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${tfe_workspace.gcp-compute-instance.id}"
}
