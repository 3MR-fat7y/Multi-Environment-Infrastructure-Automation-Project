##############################---ec2-bastion-host---##############################

resource "aws_instance" "bastion-host" {
  ami                         = "ami-026ebd4cfe2c043b2"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-1.id
  vpc_security_group_ids      = [aws_security_group.sgs-bastion.id]
  key_name                    = aws_key_pair.private-key.key_name
  associate_public_ip_address = true
}

##############################---ec2-app-host---##############################

resource "aws_instance" "application-host" {
  ami                    = "ami-026ebd4cfe2c043b2"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private-1.id
  vpc_security_group_ids = [aws_security_group.sgs-app.id]
  key_name               = aws_key_pair.private-key.key_name

}