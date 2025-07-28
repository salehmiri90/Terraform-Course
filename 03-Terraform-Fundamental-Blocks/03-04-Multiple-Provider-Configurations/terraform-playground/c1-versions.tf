# Task for Home
/*
Run terraform init and check the created files and their contents
*/

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.3"
    }
  }
}

# resource block
provider "local" {
  alias = "a"
}

provider "local" {
  alias = "b"
}