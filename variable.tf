variable "region" {
  type    = string
  default = "us-east-1"
}
variable "vpc-cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public-1-cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "public-2-cidr" {
  type    = string
  default = "10.0.2.0/24"
}
variable "private-1-cidr" {
  type    = string
  default = "10.0.3.0/24"
}
variable "private-2-cidr" {
  type    = string
  default = "10.0.4.0/24"
}
variable "instance-type" {
  type    = string
  default = "t2.micro"
}
variable "ec2-ami" {
  type    = string
  default = "ami-026ebd4cfe2c043b2"
}
