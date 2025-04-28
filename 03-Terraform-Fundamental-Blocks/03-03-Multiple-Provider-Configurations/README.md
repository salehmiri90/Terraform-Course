# Multiple Provider Configurations

## Step-01: Introduction
- Understand and Implement Multiple Provider Configurations

## Step-02: How to define multiple provider configuration of same Provider?
- Understand about default provider
- Understand and define multiple provider configurations of same provider
```t
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
```

## Step-03: How to reference the non-default provider configuration in a resource?
```t
# Resource Block to Create VM in vcenter2
resource "vsphere_virtual_machine" "resource2_vm" {
  name     = "resource2_vm"
  #<PROVIDER NAME>.<ALIAS>
  provider = vsphere.cluster2
  ...
}
```

## Step-04: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration Files
terraform validate

# Generate Terraform Plan
terraform plan

# Create Resources
terraform apply -auto-approve

# Verify the same
1. Verify the created VM in Cluster1
2. Verify the created VM in Cluster2
```

## Step-05: Clean-Up 
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

# Delete Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## References
- [Provider Meta Argument](https://www.terraform.io/docs/configuration/meta-arguments/resource-provider.html)