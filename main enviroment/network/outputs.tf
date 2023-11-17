
#attributes

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "publicsubnet1_id" {
  value = aws_subnet.public-1.id
}

output "publicsubnet2_id" {
  value = aws_subnet.public-2 .id
}
output "privatesubnet1_id" {
  value = aws_subnet.private-1.id
}

output "privatesubnet2_id" {
  value = aws_subnet.private-2.id
} 