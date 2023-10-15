data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["cognito-idp:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy" {
  name        = "eks-cognito-policy"
  description = "Full access to cognito from EKS Nodes"
  policy      = data.aws_iam_policy_document.policy.json

  tags = {
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}