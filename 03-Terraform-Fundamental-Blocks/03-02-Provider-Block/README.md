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
  required_version = "~> 1.8.0"
  required_providers {
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
    }
  }
}
```


## Step-04: Provider Block  
- Create a Provider Block for VMware
```t
# Provider Block
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
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
resource "vsphere_virtual_machine" "saleh_vm" {
  name             = "saleh-vm"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus = 4
  memory   = 10240

  guest_id = "otherGuest"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
  }
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout = 0
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
- [ESXi Provider Documentation](https://registry.terraform.io/providers/josenk/esxi/docs)