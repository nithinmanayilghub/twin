terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Values are supplied via -backend-config in scripts/deploy.sh so that
  # each environment (dev/test/prod) gets its own state file in this bucket.
  backend "s3" {}
}

provider "aws" {
  # Uses AWS CLI configuration (aws configure)
}

# CloudFront requires ACM certificates to live in us-east-1
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}