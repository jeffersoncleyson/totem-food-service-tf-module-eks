resource "aws_eks_node_group" "private-nodes" {
  cluster_name = aws_eks_cluster.cluster.name
  node_group_name = var.eks_private_node_group_name
  node_role_arn = aws_iam_role.nodes.arn

  subnet_ids = [
    aws_subnet.private-availability-zone-one.id,
    aws_subnet.private-availability-zone-two.id
  ]

  capacity_type = var.eks_node_capacity_types
  instance_types = var.eks_node_instance_types

  scaling_config {
    desired_size = var.eks_node_scaling_config_desized_size
    max_size = var.eks_node_scaling_config_max_size
    min_size = var.eks_node_scaling_config_min_size
  }

  update_config {
    max_unavailable = var.eks_node_update_config_max_unavailable
  }

  labels = {
    role = "general"
  }

  tags = {
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.nodes-AmazonCognitoEKSWorkerPolicy,
    aws_iam_role_policy_attachment.nodes-AmazonSNSEKSWorkerPolicy,
    aws_iam_role_policy_attachment.nodes-AmazonSQSEKSWorkerPolicy,
  ]
  
}
