output "openid_claims" {
  description = "OpenID Claims for trust relationship"
  value       = one(jsondecode(aws_iam_role.tfc_role.assume_role_policy).Statement).Condition
}

output "role_arn" {
  description = "ARN for trust relationship role"
  value       = aws_iam_role.tfc_role.arn
}

output "aws_dynamic_creds_varset_id" {
  value = tfe_variable_set.aws-dynamic-creds.id
}