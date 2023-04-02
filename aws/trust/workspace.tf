data "tfe_variable_set" "tfc-token-varset" {
  name         = var.tfc-token-variable-set
  organization = var.tfc_organization_name
}

data "tfe_variable_set" "hcp-packer-varset" {
  name         = var.hcp-packer-variable-set
  organization = var.tfc_organization_name
}

resource "tfe_workspace" "demo-s3-webapp" {
  name         = var.tfc_workspace_name
  organization = var.tfc_organization_name
  project_id   = var.project_id
}

resource "tfe_variable" "demo-s3-webapp-aws-provider-auth" {
  key      = "TFC_AWS_PROVIDER_AUTH	"
  value    = true
  category = "env"
  #   workspace_id = tfe_workspace.demo-s3-webapp.id
  description     = "Create a terraform workspace variable - TFC_AWS_PROVIDER_AUTH and set it to True"
  variable_set_id = tfe_variable_set.aws-dynamic-creds.id
}

resource "tfe_variable" "demo-s3-webapp-aws-run-role-arn" {
  key      = "TFC_AWS_RUN_ROLE_ARN"
  value    = aws_iam_role.tfc_role.arn
  category = "env"
  #   workspace_id = tfe_workspace.demo-s3-webapp.id
  description     = "Create a terraform workspace variable - TFC_AWS_RUN_ROLE_ARN and provide the role_arn output"
  variable_set_id = tfe_variable_set.aws-dynamic-creds.id
}

resource "tfe_workspace_variable_set" "tfc-token" {
  variable_set_id = data.tfe_variable_set.tfc-token-varset.id
  workspace_id    = tfe_workspace.demo-s3-webapp.id
}

resource "tfe_workspace_variable_set" "demo-s3-dynamic-creds-varset" {
  variable_set_id = tfe_variable_set.aws-dynamic-creds.id
  workspace_id    = tfe_workspace.demo-s3-webapp.id
}

resource "tfe_workspace_variable_set" "demo-s3-hcp-packer-varset" {
  variable_set_id = data.tfe_variable_set.hcp-packer-varset.id
  workspace_id    = tfe_workspace.demo-s3-webapp.id
}
