# Terraform Provider Block

## Step-01: Introduction
- What are Terraform Providers?
- What Providers Do?
- Where do providers reside (Terraform Registry)?
- How to use Providers?
- What are Provider Badges?


## Step-02: Terraform Providers
- What are Terraform Providers?
- What Providers Do?
- Where do providers reside (Terraform Registry)?


## Step-03: Provider Requirements
- Define required providers in Terraform Block
- Understand about three things about defining `required_providers` in terraform block
  - local names
  - source
  - version
```t
# Terraform Block
terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
  }
}
```


## Step-04: Provider Block  
- Create a Provider Block for VMware
```t
# Provider Block
provider "esxi" {
  esxi_hostname = "192.168.1.10"
  esxi_hostport = "22"
  esxi_hostssl  = "443"
  esxi_username = "root"
  esxi_password = "password"
}
```

```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan
```  

## Step-05: Add a Resource Block to create a new VM

```t
resource "esxi_guest" "vmsalehmiri01" {
  guest_name = "vmsalehmiri01"
  disk_store = "DS_001"
  network_interfaces {
    virtual_network = "VM Network"
  }
}
```

## Step-06: Execute Terraform commands to create a new VM
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan

# Create Resources using Terraform Apply
terraform apply -auto-approve
```  

## Step-07: Clean-Up 
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

# Delete Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```


## References
- [Terraform Providers](https://www.terraform.io/docs/configuration/providers.html)
- [ESXi Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)