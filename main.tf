resource "aws_eks_cluster" "cluster" {
  name = var.cluster_eks_name
  role_arn = aws_iam_role.eks-iam-role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-availability-zone-one.id,
      aws_subnet.private-availability-zone-two.id,
      aws_subnet.public-availability-zone-one.id,
      aws_subnet.public-availability-zone-two.id
    ]
  }

  tags = {
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }

  depends_on = [ aws_iam_role_policy_attachment.amazonEKSClusterPolicy ]
}
