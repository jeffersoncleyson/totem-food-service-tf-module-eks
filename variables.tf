# Input variable definitions

variable "application_name" {
  description = "Application name"
  type        = string
}

variable "environment" {
  description = "Application environment"
  type        = string
}

variable "owner_team" {
  description = "Owener Application team"
  type        = string
}

############################################### [IGW] Variables
variable "internet_gateway_tag_name" {
  description = "Internet Gateway Tag Name"
  type        = string
}
###############################################

############################################### [EKS] Variables
variable "cluster_eks_name" {
  description = "Cluster EKS Name"
  type        = string
}

variable "cluster_policy_eks_iam_role_name" {
  description = "Cluster Policy EKS IAM Role Name"
  type        = string
}
###############################################

############################################### [EKS Subnets] Variables
variable "eks_private_subnet_one_availability_zone" {
  description = "EKS private subnet one - Availability Zone"
  type        = string
  default = "us-east-1a"
}

variable "eks_private_subnet_two_availability_zone" {
  description = "EKS private subnet two - Availability Zone"
  type        = string
  default = "us-east-1b"
}

variable "eks_public_subnet_one_availability_zone" {
  description = "EKS public subnet one - Availability Zone"
  type        = string
  default = "us-east-1a"
}

variable "eks_public_subnet_two_availability_zone" {
  description = "EKS public subnet two - Availability Zone"
  type        = string
  default = "us-east-1b"
}
###############################################

############################################### [EKS Nodes] Variables
variable "eks_iam_role_name_for_nodes_groups" {
  description = "EKS IAM Role Name for nodes group"
  type        = string
}

variable "eks_private_node_group_name" {
  description = "EKS Private node group name"
  type        = string
}

variable "eks_node_capacity_types" {
  description = "EKS node capacity type"
  type        = string
  default = "SPOT"
}

variable "eks_node_instance_types" {
  description = "EKS node instances types"
  type        = list(string)
  default = ["t3.small"]
}

variable "eks_node_scaling_config_min_size" {
  description = "EKS node Scaling config min size"
  type        = number
  default = 1
}

variable "eks_node_scaling_config_max_size" {
  description = "EKS node Scaling config max size"
  type        = number
  default = 2
}

variable "eks_node_scaling_config_desized_size" {
  description = "EKS node Scaling config desized size"
  type        = number
  default = 1
}

variable "eks_node_update_config_max_unavailable" {
  description = "EKS node Update config max unavailable"
  type        = number
  default = 1
}
###############################################