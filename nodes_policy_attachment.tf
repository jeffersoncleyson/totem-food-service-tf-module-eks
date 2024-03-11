resource "aws_iam_role_policy_attachment" "nodes-AmazonCognitoEKSWorkerPolicy" {
  role       = aws_iam_role.nodes.name
  policy_arn = aws_iam_policy.policy_cognito.arn
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonSNSEKSWorkerPolicy" {
  role       = aws_iam_role.nodes.name
  policy_arn = aws_iam_policy.policy_sns.arn
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonSQSEKSWorkerPolicy" {
  role       = aws_iam_role.nodes.name
  policy_arn = aws_iam_policy.policy_sqs.arn
}