# Terraform Local Values

## Step-01: Introduction
- Understand DRY Principle
- What is local value in terraform?
- When To Use Local Values?
- What is the problem locals are solving ?

```
What is DRY Principle ?
Don't repeat yourself

What is local value in terraform?
The local block defines one or more local variables within a module. 
A local value assigns a name to an terraform expression, allowing it to be used multiple times within a module without repeating it.

When To Use Local Values?
Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration
If overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.
Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.

What is the problem locals are solving ?
Currently terraform doesn’t allow variable substitution within variables. The terraform way of doing this is by using local values or locals where you can somehow keep your code DRY.

Another use case (at least for me) for locals is to shorten references on upstream terraform projects as seen below. This will make your terraform templates/modules more readable.
```

## Step-02: Create / Review Terraform configuration files
- c1-versions.tf
- c2-variables.tf
- c3-saleh-vm.tf
- c4-output.tf
- c5-outputfile.tf


## Step-03: Test the Terraform configuration using commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Create Resources (Optional)
terraform apply -auto-approve

# Enter information on the fly
var.env
  Deployment environment (e.g. dev, prod)

  Enter a value: dev

var.project_name
  Name of the project

  Enter a value: saleh
```

# Verify VM Name
```t
Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + virtual_machine_name = "dev-saleh-vm"
  + vm_id                = (sensitive value)
  + vm_state             = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

local_file.output_file: Creating...
local_file.output_file: Creation complete after 0s [id=e410398687c36c4e3ae1528be41]
vsphere_virtual_machine.saleh_vm: Creating...
vsphere_virtual_machine.saleh_vm: Creation complete after 3s [id=4233f0f5-f472-bf7dc8b7cc03]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

virtual_machine_name = "dev-saleh-vm"
vm_id = <sensitive>
vm_state = "on"
```

## References
- [Terraform Local values](https://www.terraform.io/docs/language/values/locals.html)