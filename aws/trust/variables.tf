variable "tfc_aws_audience" {
  type        = string
  default     = "aws.workload.identity"
  description = "The audience value to use in run identity tokens"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with AWS"
}

variable "tfc_organization_name" {
  type        = string
  description = "The name of your Terraform Cloud organization"
}

variable "tfc_project_name" {
  type        = string
  default     = "Infrastructure Series"
  description = "The project under which a workspace will be created"
}

variable "tfc_workspace_name" {
  type        = string
  default     = "demo-s3-webapp"
  description = "The name of the workspace that you'd like to create and connect to AWS"
}

variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region for all resources"
}

variable "project_id" {
  default = "prj-fa4HJwnmZKgreDPz"
}

variable "tfc-token-variable-set" {
  default = "samuellee-dev tfc API token"
}

variable "hcp-packer-variable-set" {
  default = "samuellee-dev HCP Client ID and Client Secret"
}
