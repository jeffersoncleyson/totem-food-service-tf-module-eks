######### COGNITO

data "aws_iam_policy_document" "document_policy_cognito" {
  statement {
    effect    = "Allow"
    actions   = [
      "cognito-idp:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy_cognito" {
  name        = "eks-cognito-policy"
  description = "Full access to cognito from EKS Nodes"
  policy      = data.aws_iam_policy_document.document_policy_cognito.json

  tags = {
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}

######### SNS

data "aws_iam_policy_document" "document_policy_sns" {
  statement {
    effect    = "Allow"
    actions   = [
      "sns:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy_sns" {
  name        = "eks-sns-policy"
  description = "Access to sns from EKS Nodes"
  policy      = data.aws_iam_policy_document.document_policy_sns.json

  tags = {
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}

######### SQS

data "aws_iam_policy_document" "document_policy_sqs" {
  statement {
    effect    = "Allow"
    actions   = [
      "sqs:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy_sqs" {
  name        = "eks-sqs-policy"
  description = "Access to sqs from EKS Nodes"
  policy      = data.aws_iam_policy_document.document_policy_sqs.json

  tags = {
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}