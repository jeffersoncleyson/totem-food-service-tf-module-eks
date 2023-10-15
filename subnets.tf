resource "aws_subnet" "private-availability-zone-one" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = var.eks_private_subnet_one_availability_zone

  tags = {
    "Name"                                                   = format("%s-%s", "private", var.eks_private_subnet_one_availability_zone)
    "kubernetes.io/role/internal-elb"                        = "1"
    format("kubernetes.io/cluster/%s", var.cluster_eks_name) = "owned",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}

resource "aws_subnet" "private-availability-zone-two" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = var.eks_private_subnet_two_availability_zone

  tags = {
    "Name"                                                   = format("%s-%s", "private", var.eks_private_subnet_two_availability_zone)
    "kubernetes.io/role/internal-elb"                        = "1"
    format("kubernetes.io/cluster/%s", var.cluster_eks_name) = "owned",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}

resource "aws_subnet" "public-availability-zone-one" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = var.eks_public_subnet_one_availability_zone
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                   = format("%s-%s", "public", var.eks_public_subnet_one_availability_zone)
    "kubernetes.io/role/internal-elb"                        = "1"
    format("kubernetes.io/cluster/%s", var.cluster_eks_name) = "owned",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}

resource "aws_subnet" "public-availability-zone-two" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = var.eks_public_subnet_two_availability_zone
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                   = format("%s-%s", "public", var.eks_public_subnet_two_availability_zone)
    "kubernetes.io/role/internal-elb"                        = "1"
    format("kubernetes.io/cluster/%s", var.cluster_eks_name) = "owned",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}
