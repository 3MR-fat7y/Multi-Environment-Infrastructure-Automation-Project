resource "aws_s3_bucket" "1234-github_actions_backend-4321" {
  bucket = "1234-github_actions_backend-4321"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.1234-github_actions_backend-4321.id
  versioning_configuration {
    status = "Enabled"
  }
}