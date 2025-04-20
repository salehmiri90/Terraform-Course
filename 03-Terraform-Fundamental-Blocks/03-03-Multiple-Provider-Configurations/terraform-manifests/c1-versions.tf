# Terraform Block
terraform {
  required_version = ">= 0.13"
  required_providers {
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
    }
  }
}

# Provider-1 for cluster1 (Default Provider)
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
}

# Provider-2 for cluster2
provider "vsphere" {
  user                 = "sre@vsphere.local"
  password             = "1404AdvancePass"
  vsphere_server       = "11.12.13.14"
  allow_unverified_ssl = true
  alias = "cluster2"
}


