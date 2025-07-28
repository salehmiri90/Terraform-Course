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
      version = ">= 2.5.0"
    }
  }
}
# resource block
resource "local_file" "saleh" { 
    filename = "playground-03-02-pets.txt" 
    content = "We love pets!"
}