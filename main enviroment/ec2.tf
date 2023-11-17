##############################---ec2-bastion-host---##############################

resource "aws_instance" "bastion-host" {
  ami                         = var.ec2-ami
  instance_type               = var.instance-type
  subnet_id                   = module.network.publicsubnet1_id
  vpc_security_group_ids      = [aws_security_group.sgs-bastion.id]
  key_name                    = aws_key_pair.private-key.key_name
  associate_public_ip_address = true
}

##############################---ec2-app-host---##############################

resource "aws_instance" "application-host" {
  ami                    = var.ec2-ami
  instance_type          = var.instance-type
  subnet_id              = module.network.privatesubnet1_id
  vpc_security_group_ids = [aws_security_group.sgs-app.id]
  key_name               = aws_key_pair.private-key.key_name
  # user_data = <<EOF
  #   #!/bin/bash
  #   touch /dev/log.txt
  #   echo hello world > /dev/log.txt
  #   EOF
}