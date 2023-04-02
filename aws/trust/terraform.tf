terraform {
  cloud {
    organization = "samuellee-dev"
    workspaces {
      name = "demo-tfc-dynamic-creds"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }
  }
}
