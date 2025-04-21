terraform {
  # Required Terraform Version
  required_version = "~> 1.8"
  # Required Providers and their Versions
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.8.2" # Optional but recommended
    }
    random = {
      source = "hashicorp/random"
      version = "3.0.1" # Optional but recommended
    }
  }
  # Experimental Features (Not required)
  experiments = [ example ]
  # Passing Metadata to Providers (Super Advanced - Terraform documentation says not needed in many cases)
  provider_meta "my-provider" {
    hello = "world"
  }
}