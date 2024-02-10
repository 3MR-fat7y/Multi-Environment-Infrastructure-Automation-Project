provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test-remote-state" {
  bucket = "test-remote-state"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.test-remote-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "test-locks" {
  name         = "test-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID" #to make sure its one apply done in the same time

  attribute {
    name = "LockID"
    type = "S"
  }
}
