# Terraform Block 

## Step-01: Introduction
- Understand about Terraform Block and its importance
- Understand how to handle version constraints for Terraform Version and Provider Version in Terraform Block

### Step-02: Understand about Terraform Settings Block
- Required Terraform Version
- Provider Requirements
- Experimental Language Features
- Passing Metadata to Providers
- Review the file named **sample-terraform-settings.tf** for more understading

## Step-03: Create a simple terraform block and play with required_version
- `required_version` focuses on underlying Terraform CLI installed on your desktop
- If the running version of Terraform on your local desktop doesn't match the constraints specified in your terraform block, Terraform will produce an error and exit without taking any further actions.
- By changing the versions try `terraform init` and observe whats happening
```
Play with Terraform Version
  required_version = "~> 1.6.0" 
  required_version = "= 1.2"    
  required_version = "= 1.0"  
  required_version = ">= 1.2"   
  required_version = "= 1.4"    
  required_version = "~> 1.4"   
 

# Terraform Block
terraform {
  required_version = "~> 1.2.0"
}

# To view my Terraform CLI Version installed on my desktop
terraform version

# Initialize Terraform
terraform init
```
## Step-04: Add Provider and play with Provider version
- `required_providers` block specifies all of the providers required by the current module, mapping each local provider name to a source address and a version constraint.

```
Play with Provider Version
      version = "~> 3.0"            
      version = ">= 3.0.0, < 3.1.0"
      version = ">= 3.0.0, <= 3.1.0"
      version = "~> 2.0"
      version = "~> 3.0"   
```

```
# Terraform Init with upgrade option to change provider version
terraform init -upgrade
```


## Step-05: Clean-Up
```
# Delete Terraform Folders & Files
rm -rf .terraform*
```

## References
- [Terraform Version Constraints](https://developer.hashicorp.com/terraform/language/expressions/version-constraints)
- [Terraform Versions - Best Practices](https://developer.hashicorp.com/terraform/language/v1.10.x/expressions/version-constraints)

