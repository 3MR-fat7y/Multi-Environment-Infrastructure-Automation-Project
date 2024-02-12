# Multi-Environment Infrastructure Automation

![Diagram](./pics/ENVIRONMENT%20ARCHITECTURE.png)

<!-- ## Table of Contents -->
<details>
  <summary><b>Table of Contents</b></summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>

## About The Project
The project provides AWS environments for dev and test to quickly apply your working environment using Terraform. Describe your infrastructure environment as code and automate the deployment process with GitHub Actions.

### Prerequisites
- [GitHub Actions](https://github.com/3MR-fat7y/Multi-Environment-Infrastructure-Automation-Project/actions/new)
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## Getting Started

* Clone the project
```bash
git clone https://github.com/3MR-fat7y/Multi-Environment-Infrastructure-Automation-Project

```

* make ur uon ripo named Multi-Environment Infrastructure Automation Project 

* then make your modifications on the [dev.tfvars][dev.tfvars-url] and [test.tfvars][test.tfvars-url] then save and push the changes as your environment requierments.

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin <https://github.com/your_username/your_repository.git>
git push -u origin main
```



<!-- [Next][Next-url]
[Next-url]: https://nextjs.org/ -->

[dev.tfvars-url]: https://github.com/3MR-fat7y/Multi-Environment-Infrastructure-Automation-Project/blob/master/main%20enviroment/dev.tfvars
[test.tfvars-url]: https://github.com/3MR-fat7y/Multi-Environment-Infrastructure-Automation-Project/blob/master/main%20enviroment/test.tfvars



![Diagram](./pics/GitHub%20action%20setup.png)
* What we want to achieve is to be able to deploy whatever you we want to AWS, using Terraform within a GitHub Action for the deployment. Also, instead of creating an AWS API Keys and Secret Keys and storing them in GitHub secrets, we can make it more secure by using the GitHub OIDC (OpenID Connect) Provider and only allowing these credentials to be run from our GitHub Action in this specific repository.

![Diagram](./pics/OIDC%20provider%20authentification.png)
* This is how it works:
- GitHub Action is going to request a JWT (Java Web Token) to the GitHub OIDC Provider.- 
- GitHub OIDC Provider will issue the signed JWT to our GitHub Action.
- GitHub Action with our signed JWT is going to request a temporary access token from the IAM Identity Provider in AWS.
- IAM Identity Provider is going to verify the signed JWT with the GitHub OIDC Provider and verify if the role we want to assume can be used by the Identity Provider.
- IAM Identity Provider is going to issue the temporary access token from the role to the GitHub Action. After this authentification, our GitHub action environment will get access to AWS following the policies we have attached to the role we assume.