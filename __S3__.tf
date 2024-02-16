resource "aws_s3_bucket" "S3_GitHub_Actions_Backend" {
  bucket = "S3_GitHub_Actions_Backend"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.S3_GitHub_Actions_Backend.id
  versioning_configuration {
    status = "Enabled"
  }
}