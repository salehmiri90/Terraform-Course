# Terraform Command Basics

## Step-0: Create Directory
```
$ mkdir /root/terraform-manifests
$ cd /root/terraform-manifests
```
## Step-01: Introduction
- Understand basic Terraform Commands
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply
  - terraform destroy      

## Step-02: Review terraform manifest for VM Instance
- **Pre-Conditions:** Ensure you have correct username and password

```
# Terraform Settings Block
terraform {
  required_version = ">= 1.2"
  required_providers {
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
      version = "2.8.1"
    }
  }
}

# Provider Block
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
}

# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  name             = "saleh-vm"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus = 4
  memory   = 10240
...
...
...
}
```

## Step-03: Terraform Core Commands
```t
# Initialize Terraform
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create EC2 Instance
terraform apply 
```

## Step-04: Verify the VM Instance in VMware ESXi Console
- Verify newly created VM instance



## Step-05: Destroy Infrastructure
```
# Destroy Instance
terraform destroy

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Step-08: Conclusion
- Re-iterate what we have learned in this section
- Learned about Important Terraform Commands
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply
  - terraform destroy     


