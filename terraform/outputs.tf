output "iam_role_name" {
  description = "The name of the IAM Role"
  value       = aws_iam_role.doit_management_role.name
}

output "iam_role_arn" {
  description = "The arn of the IAM Role"
  value       = aws_iam_role.doit_management_role.arn
}
