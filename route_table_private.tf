resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block                 = "0.0.0.0/0"
    nat_gateway_id             = aws_nat_gateway.nat.id
    carrier_gateway_id         = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = ""
    local_gateway_id           = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }

  tags = {
    Name = "private",
    App  = var.application_name,
    Environment = var.environment,
    OwnerTeam = var.owner_team
  }
}


resource "aws_route_table_association" "private-us-east-1a" {
  subnet_id      = aws_subnet.private-availability-zone-one.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-us-east-1b" {
  subnet_id      = aws_subnet.private-availability-zone-two.id
  route_table_id = aws_route_table.private.id
}
