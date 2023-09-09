terraform {
  backend "s3" {
    bucket         = "test-back-end"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "test2"
  }
}
