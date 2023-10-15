resource "aws_eip" "nat" {

  tags = {
    Name = "nat",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-availability-zone-one.id

  tags = {
    Name = "nat",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }

  depends_on = [aws_internet_gateway.igw]
}
