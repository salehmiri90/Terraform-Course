# Task for Home
/*
Change the provider version and get backup from lock file
then check the provider path on the local directory
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
resource "local_file" "saleh" { 
    filename = "playground-03-03-pets.txt" 
    content = "We love pets!"
}