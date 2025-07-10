# Terraform Block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
      version = "2.8.1"
    }
  }
}

# Provider-1 for vcenter1 (Default Provider)
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
}

# Provider-2 for vcenter2
provider "vsphere" {
  user                 = "sre@vsphere.local"
  password             = "1404AdvancePass"
  vsphere_server       = "11.12.13.14"
  allow_unverified_ssl = true
  alias = "cluster2"
}


