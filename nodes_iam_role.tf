resource "aws_iam_role" "nodes" {
  name = var.eks_iam_role_name_for_nodes_groups

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })

  tags = {
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}