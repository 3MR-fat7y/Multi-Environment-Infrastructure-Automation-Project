terraform {
  backend "s3" {
    bucket         = "my-first-test-back-end"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "test2"
  }
}
