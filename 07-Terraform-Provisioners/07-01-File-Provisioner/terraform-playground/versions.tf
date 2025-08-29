# Terraform Settings Block
terraform {
  required_version = "1.8.4"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

# Provider Block
provider "local" {}