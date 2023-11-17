output "ec2_public_ip" {
  value = aws_instance.bastion-host.public_ip
}