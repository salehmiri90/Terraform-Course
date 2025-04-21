terraform {
  required_version = "~> 1.2"

  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.8.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}