provider "aws" {
  region = "us-east-1"
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


resource "aws_s3_bucket" "terraform-state-actions" {
  bucket = "terraform-state-actions"
  lifecycle {
    prevent_destroy = false
  }
}
output "aws_s3_bucket_arn" {
  value = aws_s3_bucket.terraform-state-actions.arn
}
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform-state-actions.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_iam_policy" "githubusercontent_policy" {
  name        = "test_githubusercontent"
  path        = "/"
  description = "My githubusercontent"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
        ],
        "Resource" : [
          "arn:aws:s3:::aws_s3_bucket.terraform-state-actions.arn/*",
          "arn:aws:s3:::aws_s3_bucket.terraform-state-actions.arn"
        ]
      }
    ]
  })
}

output "aws_iam_policy" {
  value = aws_iam_policy.githubusercontent_policy.arn
}

resource "aws_iam_role" "githubusercontent_role" {
  name = "githubusercontent_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode(
    {
      "Version" : "2008-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : aws_iam_openid_connect_provider.github-auth.arn
          },
          "Action" : "sts:AssumeRoleWithWebIdentity",
          "Condition" : {
            "StringLike" : {
              "token.actions.githubusercontent.com:sub" : "repo:https://github.com/3MR-fat7y/actions:*"
              # repo:YOUR_GITHUB_USERNAME/YOUR_REPO_NAME:* (here you can use a spacific branch or any branch by '*')
            }
          }
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "githubusercontent_role_attachment" {
  role       = aws_iam_role.githubusercontent_role.name
  policy_arn = "arn:aws:iam::aws:iam::aws:policy/githubusercontent_policy"

}

variable "github_client_id" {
  description = "Client ID of the GitHub OAuth App"
  type        = string
}

variable "github_thumbprint" {
  description = "Thumbprint of GitHub's certificate"
  type        = string
}

resource "aws_iam_openid_connect_provider" "github-auth" {
  url = "https://token.actions.githubusercontent.com"
  # client_id       = "sts.amazonaws.com"
  client_id_list  = [var.github_client_id]
  thumbprint_list = [var.github_thumbprint]
}


output "openid_connect_provider_arn" {
  value = aws_iam_openid_connect_provider.github-auth.arn
}