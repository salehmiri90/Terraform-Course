# Terraform Settings Block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
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