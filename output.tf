# Output value definitions

############################################### [EKS] Outputs

output "cluster_eks_name" {
  description = "Cluster EKS name"

  value = aws_eks_cluster.cluster.name
}

output "vpc_link" {
  description = "VPC Link EKS ID"

  value = aws_security_group.vpc_link.id
}

output "private_subnet_one" {
  description = "EKS Private Subnet ID"

  value = aws_subnet.private-availability-zone-one.id
}

output "private_subnet_two" {
  description = "EKS Private Subnet ID"

  value = aws_subnet.private-availability-zone-two.id
}

###############################################
