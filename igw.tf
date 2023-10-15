resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id


  tags = {
    Name = var.internet_gateway_tag_name,
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}
