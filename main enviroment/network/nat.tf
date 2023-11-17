

##############################---eip---##############################

resource "aws_eip" "nat" {
  domain = "vpc"
}


##############################---nat-gateway---##############################

resource "aws_nat_gateway" "my_nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-1.id

  tags = {
    Name = "gw NAT"
  }
}