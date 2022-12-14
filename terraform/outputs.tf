output "iam_role_name" {
  description = "The name of the IAM Role"
  value       = aws_iam_role.doit-management-role.name
}

output "iam_role_arn" {
  description = "The arn of the IAM Role"
  value       = aws_iam_role.doit-management-role.arn
}