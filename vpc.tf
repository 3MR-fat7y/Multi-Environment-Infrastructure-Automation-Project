
##############################---VPC---##############################

resource "aws_vpc" "my_vpc" {
  region = "us-east-1"
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name = "main_vpc"
  }
} 