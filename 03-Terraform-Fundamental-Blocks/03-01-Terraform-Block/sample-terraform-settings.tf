terraform {
  # Required Terraform Version
  required_version = "~> 1.8.0"
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
  # Remote Backend for storing Terraform state in S3 bucket
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
  # configuration options
  }
  # Experimental Features (Not required)
  experiments = [ example ]
  # Passing Metadata to Providers (Super Advanced - Terraform documentation says not needed in many cases)
  provider_meta "my-provider" {
    hello = "world"
  }
}