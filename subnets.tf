
##############################---puplic-subnet---##############################

resource "aws_subnet" "public-1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public subnet 2"
  }
}

##############################---private-subnet---##############################

resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "private subnet 2"
  }
}
