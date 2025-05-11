# Terraform Resource Syntax & Behavior

## Step-01: Introduction
- Understand Resource Syntax
- Understand Resource Behavior
- Understanding Terraform State File
  - terraform.tfstate
- Understanding Desired and Current States (High Level Only)

## Step-02: Understand Resource Syntax
- We are going to understand about below concepts from Resource Syntax perspective
- Resource Block
- Resource Type
- Resource Local Name
- Resource Arguments
- Resource Meta-Arguments

## Step-03: Understand Resource Behavior
- We are going to understand resource behavior in combination with Terraform State
  - Create Resource
  - Update in-place Resources
  - Destroy and Re-create Resources
  - Destroy Resource  


## Step-04: Resource: Create Resource: Create VM Instance
```
# Initialize Terraform
terraform init

Observation: 
1) Successfully downloaded providers in .terraform folder
2) Created lock file named ".terraform.lock.hcl"

# Validate Terraform configuration files
terraform validate
Observation: No files changed / added in current working directory

# Format Terraform configuration files
terraform fmt
Observations: *.tf files will change to format them if any format changes exists

# Review the terraform plan
terraform plan 
Observation-1: Nothing happens during the first run from terraform state perspective
Observation-2: From Resource Behavior perspective you can see "+ create", we are creating 

# Create Resources 
terraform apply
Observation: 
1) Creates terraform.tfstate file in local working directory
2) Creates actual resource in vCenter
```
- **Important Note:** Here we have seen example for **Create Resource**


## Step-05: Understanding Terraform State File
- What is Terraform State ? 
  - It is the primary core thing for terraform to function
  - In a short way, its the underlying database containing the resources information which are provisioning using Terraform

  - **Primary Purpose:** To store bindings between objects in a remote system and resource instances declared in your configuration. 
  - When Terraform creates a remote object in response to a change of configuration, it will record the identity of that remote object against a particular resource instance, and then potentially update or delete that object in response to future configuration changes.
- Terraform state file created when we first run the `terraform apply`
- Terraform state file is created locally in working directory.
- If required, we can confiure the `backend block` in `terraform block` which will allow us to store state file remotely.  Storing remotely is recommended option which we will see in the next section of the course. 

## Step-06: Review terraform.tfstate file
- Terraform State files are JSON based
- Manual editing of Terraform state files is highly not recommended
- Review `terraform.tfstate` file step by step


## Step-07: Resource: Update In-Place: Make changes by changing CPU/Memory on VM Instance 
- Change CPU Memory value in `c2-saleh-vm.tf`
```
# Change CPU Memory for VM Instance
    num_cpus = 6
    memory   = 6144
```
- Review Terraform Plan
```
# Review the terraform plan
terraform plan 
Observation: You should see "~ update in-place" 
"Plan: 0 to add, 1 to change, 0 to destroy."

# Create / Update Resources 
terraform apply
Observation: "Apply complete! Resources: 0 added, 1 changed, 0 destroyed."
```
- **Important Note:** Here we have seen example for **update in-place**


## Step-08: Resource: Destroy and Re-create Resource
Use codes in terraform-manifests-2 directory.
```
# Destroy and recreate Resources
terraform apply 
Observation: 
1) -/+ destroy and then create replacement
2) # null_resource.trigger must be replaced
3) # vsphere_virtual_machine.saleh_vm will be replaced due to changes in replace_triggered_by
4) Plan: 2 to add, 0 to change, 2 to destroy
5) Apply complete! Resources: 2 added, 0 changed, 2 destroyed.
```

## Step-09: Understand Desired and Current States (High-Level Only)
- **Desired State:** Local Terraform Manifest (All *.tf files)
- **Current State:**  Real Resources present in your cloud

## Step-10: Clean-Up
```
# Destroy Resource
terraform destroy -auto-approve 

# Remove Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## References
- [Terraform State](https://www.terraform.io/docs/language/state/index.html)
- [Terraform fmt](https://developer.hashicorp.com/terraform/cli/commands/fmt)
- [Manipulating Terraform State](https://www.terraform.io/docs/cli/state/index.html)