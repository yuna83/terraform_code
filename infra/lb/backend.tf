terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "user08-terraform-state"
    key            = "infra/lb/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "user08-terraform-locks"
    encrypt        = true
  }
}