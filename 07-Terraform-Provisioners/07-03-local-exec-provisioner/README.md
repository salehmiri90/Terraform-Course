# Terraform local-exec Provisioner

## Step-00: Pre-requisites
- Create path with name `vm_creation.log` in the folder `logs` in `terraform-manifest` folder
- Because of using local-exec, there are no need for connection block, execute scripts using `local-exec provisioner`

## Step-01: Introduction
- Understand about **local-exec** Provisioner
- The `local-exec` provisioner invokes a local executable after a resource is created. 
- This invokes a process on the machine running Terraform, not on the resource. 

## Step-02: Review local-exec provisioner code
- We will create one provisioner during creation-time. It will output VM creation logs of the instance in to a file named `vm_creation.log`

```t
  # local-exec provisioner (Triggered during Create Resource)
  provisioner "local-exec" {
    command = "echo 'VM ${self.name} created on Today!' >> ./logs/vm_creation.log && false"
  }
```

## Step-03: Review Terraform manifests & Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Format
terraform fmt

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

# Verify
Verify the file in folder "./logs/vm_creation.log"

```
## Step-04: Clean-Up Resources & local working directory
```t
# Terraform Destroy
terraform destroy -auto-approve

# Verify
Verify the file in folder "./logs/vm_creation.log"

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Reference
- [Local Exec Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)
