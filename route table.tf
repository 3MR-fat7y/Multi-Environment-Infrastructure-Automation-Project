
##############################---create-public-route-table---##############################

resource "aws_route_table" "igw-route-table-public" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public_tbale"
  }

}

##############################---create-private-route-table---##############################

resource "aws_route_table" "nat-route-table-private" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my_nat.id
  }
  tags = {
    Name = "private_tbale"
  }

}


##############################---association-route-table---##############################

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.igw-route-table-public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.igw-route-table-public.id
}


resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.nat-route-table-private.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.nat-route-table-private.id
}





# resource "aws_route_table" "example" {
#   vpc_id = aws_vpc.example.id
# }
