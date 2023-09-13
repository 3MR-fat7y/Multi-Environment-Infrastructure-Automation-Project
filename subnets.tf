
##############################---puplic-subnet---##############################

resource "aws_subnet" "public-1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public-1-cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public-2-cidr

  tags = {
    Name = "public subnet 2"
  }
}

##############################---private-subnet---##############################

resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private-1-cidr

  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private-2-cidr

  tags = {
    Name = "private subnet 2"
  }
}
