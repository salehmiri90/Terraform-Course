# Terraform Resource Meta-Argument lifecycle

## Step-01: Introduction
- lifecyle Meta-Argument block contains 3 arguments
  - create_before_destroy
  - prevent_destroy
  - ignore_changes
- Understand and implement each of these 3 things practically in a step by step manner  

## Step-02: lifecyle - create_before_destroy
- Default Behavior of a Resource: Destroy Resource & re-create Resource
- With Lifecycle Block we can change that using `create_before_destroy=true`
  - First new resource will get created
  - Second old resource will get destroyed
- **Add Lifecycle Block inside Resource Block to alter behavior**  
```t
  lifecycle {
    create_before_destroy = true
  }
```  
### Step-02-01: Observe without Lifecycle Block
```t
# Switch to Working Directory
cd v1-create_before_destroy

# Initialize Terraform
terraform init

# Validate Terraform Configuration Files
terraform validate

# Format Terraform Configuration Files
terraform fmt

# Generate Terraform Plan
terraform plan

# Create Resources
terraform apply -auto-approve

# Modify Resource Configuration
Change datastore name from datastore1 to datastore2

# Apply Changes
terraform apply -auto-approve
Observation: 
1) First datastore1 resource will be destroyed
2) Second datastore2 resource will get
```
### Step-02-02: With Lifecycle Block
- Add Lifecycle block in the resource
```t
# Generate Terraform Plan
terraform plan

# Apply Changes
terraform apply -auto-approve

# Modify Resource Configuration
Change datastore name from datastore1 to datastore2

# Apply Changes
terraform apply -auto-approve
Observation: 
1) First datastore1 resource will get created
2) Second datastore2 resource will get deleted
```
### Step-02-03: Clean-Up Resources
```t
# Destroy Resources
terraform destroy -auto-approve

# Clean-Up 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Step-03: lifecycle - prevent_destroy
### Step-03-01: Introduction
- This meta-argument, when set to true, will cause Terraform to reject with an error any plan that would destroy the infrastructure object associated with the resource, as long as the argument remains present in the configuration.
- This can be used as a measure of safety against the accidental replacement of objects that may be costly to reproduce, such as database instances
- However, it will make certain configuration changes impossible to apply, and will prevent the use of the `terraform destroy` command once such objects are created, and so this option should be used `sparingly`.
- Since this argument must be present in configuration for the protection to apply, note that this setting does not prevent the remote object from being destroyed if the resource block were removed from configuration entirely: in that case, the `prevent_destroy` setting is removed along with it, and so Terraform will allow the destroy operation to succeed.
```t
  lifecycle {
    prevent_destroy = true # Default is false
  }
```
### Step-03-02: Execute Terraform Commands
```t
# Switch to Working Directory
cd v2-prevent_destroy

# Initialize Terraform
terraform init

# Validate Terraform Configuration Files
terraform validate

# Format Terraform Configuration Files
terraform fmt

# Generate Terraform Plan
terraform plan

# Create Resources
terraform apply -auto-approve

# Destroy Resource
terraform destroy 
Observation: 
Plan: 0 to add, 0 to change, 1 to destroy.
╷
│ Error: Instance cannot be destroyed
│
│   on c2-saleh-vm.tf line 22:
│   22: resource "vsphere_virtual_machine" "saleh_vm" {
│
│ Resource vsphere_virtual_machine.saleh_vm has lifecycle.prevent_destroy set, but the plan calls for this resource to be destroyed. To avoid this error
│ and continue with the plan, either disable lifecycle.prevent_destroy or reduce the scope of the plan using the -target option.

# Remove/Comment Lifecycle block
- Remove or Comment lifecycle block and clean-up

# Destroy Resource after removing lifecycle block
terraform destroy

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*
```


## Step-04: lifecyle - ignore_changes
### Step-04-01: Create an VM Changes, make manual changes and understand the behavior
- Create VM Instance
```t
# Switch to Working Directory
cd v3-ignore_changes

# Initialize Terraform
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create VM Instance
terraform apply 
```
### Step-04-02: Update the VM name by going to vCenter management console or terraform code
- Add a new name manually to VM Instance
- Try `terraform apply` now
- Terraform will find the difference in configuration on remote side when compare to local and tries to remove the manual change when we execute `terraform apply`
```t
# Add new tag manually
saleh-lifecycle3 = saleh-lifecycle3-new

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create VM Instance
terraform apply 
Observation: 
1) It will remove the changes which we manually added using vCenter Management console
```

### Step-04-03: Add the lifecyle - ignore_changes block
- Enable the block in `c2-saleh-vm.tf`

```t
  lifecycle {
    ignore_changes = [name]
  }
```
- Add new name manually using vCenter mgmt console for the VM Instance
```t
# Add new tag manually
saleh-lifecycle3 = saleh-lifecycle312231232
ignorechanges = name

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create VM Instance
terraform apply 
Observation: 
1) Manual changes should not be touched. They should be ignored by terraform
2) Verify the same on vCenter management console

# Destroy Resource
terraform destroy -auto-approve

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## References
- [Resource Meat-Argument: Lifecycle](https://www.terraform.io/docs/language/meta-arguments/lifecycle.html)