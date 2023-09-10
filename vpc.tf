
##############################---VPC---##############################

resource "aws_vpc" "my_vpc" {
  # region = "us-east-1"
  region = var.region
  # cidr_block           = "10.0.0.0/16"
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = "true"
  tags = {
    Name = "main_vpc"
  }
} 