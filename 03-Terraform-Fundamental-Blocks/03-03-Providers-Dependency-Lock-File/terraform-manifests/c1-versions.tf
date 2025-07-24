# Terraform Settings Block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.0.0"  #open .terraform.lock.hcl file, then change this file to .terraform.lock.hcl-backup
      #version = ">= 2.0.0" #new created .terraform.lock.hcl file
      #check below path: .terraform/providers/registry.terraform.io/hashicorp/vsphere/
    }
  }
}

# Provider Block
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
}