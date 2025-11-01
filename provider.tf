provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Project     = "WebApp"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
#   backend "s3" {
#     bucket         = "mycompany-terraform-state"
#     key            = "web-app/terraform.tfstate"
#     region         = "eu-central-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock"
#   }
}