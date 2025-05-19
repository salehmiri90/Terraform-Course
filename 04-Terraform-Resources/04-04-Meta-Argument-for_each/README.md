# Terraform Resource Meta-Argument for_each

## Step-01: Introduction
- Understand about Meta-Argument `for_each`
- Implement `for_each` with **Maps**
- Implement `for_each` with **Set of Strings**

## Step-02: Implement for_each with Maps
- **Reference Folder:** v1-for_each-maps
- **Use case:** Create five VMs using for_each maps with different disk capacity
- **c2-saleh-vm.tf**
```t
resource "vsphere_virtual_machine" "saleh_vm" {
  # for_each Meta-Argument
  for_each = {
    "vm-a" = 5
    "vm-b" = 10
    "vm-c" = 15
    "vm-d" = 20
    "vm-e" = 25
  }
  name     = "saleh-${each.key}"
  ...
  disk {
    # for_each Meta-Argument
    label            = "saleh-${each.key}-disk0"
    size             = each.value
    eagerly_scrub    = false
    thin_provisioned = true
  }
}
```

## Step-03: Execute Terraform Commands
```t
# Switch to Working Directory
cd v1-for_each-maps

# Initialize Terraform
terraform init

# Validate Terraform Configuration Files
terraform validate

# Format Terraform Configuration Files
terraform fmt

# Generate Terraform Plan
terraform plan
Observation: 
1) Five VMs creation will be generated in plan
2) Review Resource Names ResourceType.ResourceLocalName[each.key]
2) Review disk names (each.key)
3) Review disk sizes (each.value)

# Create Resources
terraform apply
Observation: 
1) 5 VMs should be created
2) Review VM names, disk names and disk sizes in vCenter Management console

# Destroy Resources
terraform destroy

# Clean-Up 
rm -rf .terraform*
rm -rf terraform.tfstate*
```


## Step-04: Implement for_each with toset "Strings"
- **Reference Folder:** v2-for_each-toset
- **Use case:** Create 3 VMs using for_each toset strings 
- **c2-saleh-vm.tf**
```t
# Variable Block
variable "vm_names" {
  default = ["tosetvm-01", "tosetvm-02", "tosetvm-03"]
}

# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  for_each = toset(var.vm_names)
  name     = "saleh-${each.key}"
  ...
}
```

## Step-05: Execute Terraform Commands
```t
# Switch to Working Directory
cd v2-for_each-toset

# Initialize Terraform
terraform init

# Validate Terraform Configuration Files
terraform validate

# Format Terraform Configuration Files
terraform fmt

# Generate Terraform Plan
terraform plan
Observation: 
1) Three VMs creation will be generated in plan
2) Review Resource Names ResourceType.ResourceLocalName[each.key]
2) Review VMs name (each.key)

# Create Resources
terraform apply
Observation: 
1) Three VMs should be created
2) Review VMs in vCenter Management console

# Destroy Resources
terraform destroy

# Clean-Up 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Reference
- [Resource Meta-Argument: for_each](https://www.terraform.io/docs/language/meta-arguments/for_each.html)