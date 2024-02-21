# OIDC Authentication for AWS with GitHub Actions

This project automates the setup of OpenID Connect (OIDC) authentication for AWS using GitHub Actions. It creates an identity provider (OIDC) for GitHub Actions, sets up a role for GitHub’s OIDC identity provider (IdP), creates a policy for storing Terraform state in an S3 bucket, and provisions the necessary resources in your AWS account.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- An AWS account with permissions to create IAM roles, policies, S3 buckets, and DynamoDB tables.
- GitHub repository where you want to set up OIDC authentication.
- GitHub Personal Access Token with the `repo` scope to authenticate GitHub Actions with your repository.

## Usage

Follow these steps to set up OIDC authentication for your AWS account:

1. Fork or clone this repository to your local machine.
2. Navigate to the root directory of the cloned repository.
3. Update the `backend.tf` file with the name of your S3 bucket for storing Terraform state.
4. Commit and push the changes to your GitHub repository.
5. Create GitHub Secrets for the required credentials:
   - `AWS_ACCESS_KEY_ID`: AWS access key ID with permissions to create resources.
   - `AWS_SECRET_ACCESS_KEY`: AWS secret access key associated with the access key ID.
   - `GITHUB_TOKEN`: GitHub Personal Access Token with the `repo` scope.
6. Trigger the GitHub Actions workflow by pushing changes to your repository.

## Getting Started

To get started with this project, follow the steps outlined in the [Usage](#usage) section. Additionally, make sure to review the Terraform files in the repository to understand the resources being provisioned and adjust them according to your requirements.

For more information about the OIDC authentication setup and the resources provisioned, refer to the Terraform documentation and AWS documentation.

