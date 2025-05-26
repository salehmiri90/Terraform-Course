# Terraform Settings Block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.8.1"
    }
  }
}

# Provider Block
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = var.vcenter_pass
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
}