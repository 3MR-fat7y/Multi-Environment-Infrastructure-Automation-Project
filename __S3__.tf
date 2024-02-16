resource "aws_s3_bucket" "github_actions_backend" {
  bucket = "github_actions_backend"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.github_actions_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}