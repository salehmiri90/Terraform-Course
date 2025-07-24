# Task for Home
/*
Play with provider version base on the information on terraform webiste, 
then 
run terraform init and check the .terraform.lock.hcl file content
*/

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
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