# Providers - Dependency Lock File

## Step-01: Introduction
- Understand the importance of Dependency Lock File which is introduced in Terraform v0.14

## Step-02: Review the Terraform Manifests
- c1-versions.tf
  - Discuss about Terraform, vSphere Provider Versions
- c2-vm.tf
  - Discuss about vSphere Virtual Machine Resource
- .terraform.lock.hcl
  - Discuss about Provider Version, Version Constraints and Hashes

## Step-03: Initialize and apply the configuration
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan

# Create Resources using Terraform Apply
terraform apply
```
- Review **.terraform.lock.hcl**
  - Discuss about versions
```
# Backup
cp .terraform.lock.hcl .terraform.lock.hcl-backup
```

## Step-04: Upgrade the vSphere provider version
- For vSphere Provider, with version constraint `version = ">= 2.0.0"`, it is going to upgrade to latest `2.x.x` version with command `terraform init -upgrade` 
```t
# Upgrade Provider Version
terraform init -upgrade
```
- Review **.terraform.lock.hcl**
  - Discuss about vSphere Versions
  - Compare `.terraform.lock.hcl-backup` & `.terraform.lock.hcl`

## Step-05: Apply Terraform configuration with latest vSphere Provider
- Should fail due to Virtual Machine related latest changes came in vSphere v2.12 provider when compared to vSphere v2.8 provider
```
# Terraform Apply
terraform apply
```

## Step-06: Comment region in Virtual Machine Resource and try Terraform Apply
- It should work. 
- When we do a major version upgrade to providers, it might break few features. 
- So with `.terraform.lock.hcl`, we can avoid this type of issues.

```
# Terraform Apply
terraform apply
```

## Step-07: Clean-Up
```
# Destroy Resources
terraform destroy

# Delete Terraform Files
rm -rf .terraform    # We are not removing files named ".terraform.lock.hcl, .terraform.lock.hcl-backup" which are needed for this demo for you.
rm -rf terraform.tfstate*
```

## References
- [vSphere Provider](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs)
- [Dependency Lock File](https://www.terraform.io/docs/configuration/dependency-lock.html)
- [Terraform New Features in v0.14](https://learn.hashicorp.com/tutorials/terraform/provider-versioning?in=terraform/0-14)
- [Upgrade the AWS provider version](https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning#upgrade-the-aws-provider-version)