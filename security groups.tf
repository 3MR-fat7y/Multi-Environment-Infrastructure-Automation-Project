
##############################---bastion-security-group---##############################

resource "aws_security_group" "sgs-bastion" {
  name        = "sgs-bastion"
  description = "Allow openssh inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "openssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_openssh"
  }
}

##############################---application-security-group---##############################

resource "aws_security_group" "sgs-app" {
  name        = "sgs-app"
  description = "Security group for SSH and port 3000"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "port 3000 VPC"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]

  }
  ingress {
    description = "openssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-app"
  }
}