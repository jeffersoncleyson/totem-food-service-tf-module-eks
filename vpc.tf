resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}
