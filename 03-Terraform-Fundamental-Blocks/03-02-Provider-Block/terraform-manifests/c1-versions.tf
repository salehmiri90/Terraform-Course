# Terraform Block
terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
  }
}

# Provider Block
provider "esxi" {
  esxi_hostname = "192.168.1.10"
  esxi_hostport = "22"
  esxi_hostssl  = "443"
  esxi_username = "root"
  esxi_password = "password"
}

