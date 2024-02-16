resource "aws_s3_bucket" "github_actions_backend_1234" {
  bucket = "github_actions_backend_1234"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.github_actions_backend_1234.id
  versioning_configuration {
    status = "Enabled"
  }
}