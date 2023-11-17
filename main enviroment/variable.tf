variable "Region" {
  type    = string
  default = "us-east-1"
}

# variable "access_key" {
#   description = "AWS Access Key ID"
# }
# variable "secret_key" {
#   description = "AWS Secret Access Key"
# }
# variable "session_token" {
#   description = "AWS Session Token"
# }

# variable "secret_key_file_path" {
#   type        = string
#   description = "Path to the file containing the AWS Secret Access Key"

# }

variable "vpc-cidr" {
  type    = string
  # default = "10.0.0.0/16"
}
variable "cidr-public-1" {
  type    = string
  # default = "10.0.1.0/24"
}
variable "cidr-public-2" {
  type    = string
  # default = "10.0.2.0/24"
}
variable "cidr-private-1" {
  type    = string
  # default = "10.0.3.0/24"
}
variable "cidr-private-2" {
  type    = string
  # default = "10.0.4.0/24"
}
variable "instance-type" {
  type    = string
  # default = "t2.micro"
}
variable "ec2-ami" {
  type    = string
  # default = "ami-026ebd4cfe2c043b2"
}
