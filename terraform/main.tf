data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "doit-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.account_id]
    }
  }
}

data "aws_iam_policy_document" "doit-iam-policy-document" {
  statement {
    sid = ""
    effect = "Allow"
    # We allow List on all resources, this allows
    # us to know what we need to update/do
    actions = [
      "iam:ListAttachedRolePolicies",
      "iam:ListEntitiesForPolicy",
      "iam:ListOpenIDConnectProviders",
      "iam:ListPolicies",
      "iam:ListPoliciesGrantingServiceAccess",
      "iam:ListPolicyVersions",
      "iam:ListRolePolicies",
      "iam:ListRoles"
    ]
    resources = ["*"]
  }
  statement {
    sid = "doit-update-own-resources"
    effect = "Allow"
    # We only allow updating on our own resources
    # which limits our ability to delete anything.
    actions = [
      "iam:AttachRolePolicy",
      "iam:CreateOpenIDConnectProvider",
      "iam:CreatePolicy",
      "iam:CreatePolicyVersion",
      "iam:CreateRole",
      "iam:CreateSAMLProvider",
      "iam:DeleteOpenIDConnectProvider",
      "iam:DeletePolicy",
      "iam:DeletePolicyVersion",
      "iam:DeleteRole",
      "iam:DetachRolePolicy",
      "iam:GetOpenIDConnectProvider",
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:GetRole",
      "iam:PutRolePolicy",
      "iam:SetDefaultPolicyVersion",
      "iam:UpdateOpenIDConnectProviderThumbprint",
      "iam:UpdateRole",
      "iam:UpdateRoleDescription"
    ]
    resources = [
      "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.aws-ops.doit-intl.com*",
      "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:policy/DoiT-*",
      "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:role/DoiT-Support*"
    ]
  }
}

resource "aws_iam_policy" "doit-iam-policy" {
  name   = "DoiT_Customer_Policy_DO-NOT-DELETE"
  policy = data.aws_iam_policy_document.doit-iam-policy-document.json
}

resource "aws_iam_role" "doit-management-role" {
  name               = "DoiT_Management_Role_DO-NOT-DELETE"
  assume_role_policy = data.aws_iam_policy_document.doit-assume-role-policy.json
}

resource "aws_iam_role_policy_attachment" "doit-management-role-attachment" {
  role       = aws_iam_role.doit-management-role.name
  policy_arn = aws_iam_policy.doit-iam-policy.arn
}
