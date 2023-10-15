resource "aws_iam_role" "eks-iam-role" {
  name = var.cluster_policy_eks_iam_role_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  tags = {
    App = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}

resource "aws_iam_role_policy_attachment" "amazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-iam-role.id
}
