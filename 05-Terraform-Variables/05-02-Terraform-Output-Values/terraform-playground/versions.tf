# Lets have fun on Linux!

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.5.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.7.0"
    }
  }
}