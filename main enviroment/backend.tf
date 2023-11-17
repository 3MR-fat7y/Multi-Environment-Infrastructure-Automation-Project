terraform {
  backend "s3" {
    bucket         = "test-remote-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    # bucket         = "my-first-test-back-end"
    # dynamodb_table = "test2"
  }
}
