# Terraform Output Values

## Step-01: Introduction
- Understand about Output Values and implement them
- Query outputs using `terraform output`
- Understand about redacting secure attributes in output values
- Generate machine-readable output

## Step-02: Basics of Output Values
- **Reference Sub folder:** v01-Output-Variables-Basic
- Understand Output Values
- You can export both Argument & Attribute References
- [Terraform AWS EC2 Instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Create Resources
terraform apply -auto-approve

# Verify Plan
Plan: 1 to add, 0 to change, 0 to destroy.
Changes to Outputs:
  + virtual_machine_name = "saleh-vm"
  + vm_id                = (known after apply)
  + vm_state             = (known after apply)

```

## Step-03: Query Terraform Outputs
- Terraform will load the project state in state file, so that using `terraform output` command we can query the state file. 
```t
# Terraform Output Commands
terraform output
terraform output virtual_machine_name
```


## Step-04: Output Values - Suppressing Sensitive Values in Output
- We can redact the sensitive outputs using `sensitve = true` in output block
- This will only redact the cli output for terraform plan and apply
- When you query using `terraform output`, you will be able to fetch exact values from `terraform.tfstate` files
- Add `sensitve = true` for output `vm_id`
```t
# Attribute Reference 
output "vm_id" {
  description = "The ID of the VM"
  value       = vsphere_virtual_machine.saleh_vm.id
  sensitive   = true
}

```
- Test the flow
```t
# Terraform Apply
terraform apply -auto-approve
Observation: You should see the value as sensitive

# Query using terraform output
terraform output ec2_publicdns
Observation: You should get non-redacted original value from terraform.tfstate file
```

## Step-05: Generate machine-readable output
```t
# Generate machine-readable output
terraform output -json
```

## Step-06: Destroy Resources
```t
# Destroy Resources
terraform destroy -auto-approve

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*
```


## References
- [Terraform Output Values](https://www.terraform.io/docs/language/values/outputs.html)