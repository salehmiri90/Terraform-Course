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
      version = "~> 2.0.0"  #open .terraform.lock.hcl file, then change this file to .terraform.lock.hcl-backup
      #version = ">= 2.0.0" #new created .terraform.lock.hcl file
      #check below path: .terraform/providers/registry.terraform.io/hashicorp/local/
    }
  }
}
# resource block
resource "local_file" "pet" { 
    filename = "/root/pets.txt" 
    content = "We love pets!"
}