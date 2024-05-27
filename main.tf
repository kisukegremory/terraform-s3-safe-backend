terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  backend "s3" {
    bucket = "terraform-tfstates-3606875b966c0974"
    key = "tfstate-backend"
    region = "us-east-2"
    dynamodb_table = "tf-state-lock-table-3606875b966c0974"
    encrypt = true
  }
}


