# Terraform Resource Meta-Argument count

## Step-01: Introduction
- Understand Resource Meta-Argument `count`
- Also implement count and count index practically 

## Step-02: Create 5 VM Instances using Terraform
- In general, 1 VM Instance Resource in Terraform equals to 1 VM Instance in Real World Cloud
- 5 VM Instance Resources = 5 VM Instances in world Cloud
- With `Meta-Argument count` this is going to become super simple. 
- Lets see how. 
```t
# Create VM Instance
# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  count    = 5
  name     = "saleh-vm-${count.index}"
  ...
}
```
- **Execute Terraform Commands**
```t
# Initialize Terraform
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create VM Instance
terraform apply 
```
- Verify VM Instances and its Name


## Step-03: Understand about count index
- If we currently see all our VM Instances has the same name `saleh-vm`
- Lets name them by using count index `saleh-vm-0, saleh-vm-1, saleh-vm-2, saleh-vm-3, saleh-vm-4`
```t
# Create VM Instance
resource "vsphere_virtual_machine" "saleh_vm" {
  count    = 5
  name     = "saleh-vm-${count.index}"
  ...
}
```
- **Execute Terraform Commands**
```t
# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create VM Instance
terraform apply 
```
- Verify VM Instances


## Step-04: Destroy Terraform Resources
```t
# Destroy Terraform Resources
terraform destroy

# Remove Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## References
- [Resources: Count Meta-Argument](https://www.terraform.io/docs/language/meta-arguments/count.html)