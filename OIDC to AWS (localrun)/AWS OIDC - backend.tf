provider "aws" {
  region = "us-east-1"
}

# Create an identity provider (OIDC) for GitHub Actions
resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["959CB2B52B4AD201A593847ABCA32FF48F838C2E"]
}

# Create the role for GitHub’s OIDC identity provider (IdP)
resource "aws_iam_role" "GitHubActionsRole" {
  name = "GitHubActionsRole"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : aws_iam_openid_connect_provider.github_actions.arn
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringLike" : { "token.actions.githubusercontent.com:sub" : "repo:3MR-fat7y/Multi-Environment-Infrastructure-Automation-Project/master:*" },
          "StringEquals" : { "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com" }
        }
      }
    ]
  })
}

# Output the ARN of the GitHub Actions role
output "value-of-github-secrete" {
  value = ">> ${aws_iam_role.GitHubActionsRole.arn} <<\nThis is the ARN of the role to store it in the GitHub secrets with the name 'AWS_ROLE'"
}

# Create the IAM policy to grant access for storing Terraform state in S3
resource "aws_iam_policy" "TerraformStatePolicy" {
  name        = "TerraformStatePolicy"
  path        = "/"
  description = "Allows storing Terraform state in S3"

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
          "${aws_s3_bucket.terraform-state-actions.arn}/*",
          "${aws_s3_bucket.terraform-state-actions.arn}"
        ]
      }
    ]
  })
}

# Attach the IAM policy to the GitHub Actions role
resource "aws_iam_role_policy_attachment" "githubusercontentroleattachment" {
  role       = aws_iam_role.GitHubActionsRole.name
  policy_arn = aws_iam_policy.TerraformStatePolicy.arn
}

# Create an S3 bucket to store the Terraform state file
resource "aws_s3_bucket" "terraform-state-actions" {
  bucket = "terraform-state-actions"
  
  lifecycle {
    prevent_destroy = false
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform-state-actions.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "test-locks" {
  name         = "test-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID" # to ensure only one apply is done at a time

  attribute {
    name = "LockID"
    type = "S"
  }
}
