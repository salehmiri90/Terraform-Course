# Terraform Null Resource

## Step-01: Introduction
- Understand about [Null Provider](https://registry.terraform.io/providers/hashicorp/null/latest/docs)
- Understand about [Null Resource](https://www.terraform.io/docs/language/resources/provisioners/null_resource.html)

- **Usecase:** Force a resource to update based on a changed null_resource
- Create Null resource with required `local-exec` provisioners
  - Local Provisioner: create VM creation log to `./logs/vm_creation.log` directory

- Over the process we will learn about
  - null_resource
  - trigger resources


## Step-02: Define null provider in Terraform Settings Block
- Update null provider info listed below in **c1-versions.tf**
```t
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
```

## Step-03: Create / Review the c3-main.tf terraform configuration
### Create Null Resource
- Create Null resource with `triggers` with `depends_on` function which will trigger for every `terraform apply`
- Also only changes will applied using only `null_resource` when `terraform apply` is run.
- Primarily the focus here is to learn the following
  - null_resource
  - null_resource trigger
  - How trigger works based on depends_on function ?
  - Provisioners in Null Resource

```t
resource "null_resource" "log_vm_creation" {
  provisioner "local-exec" {
    command     = "echo 'VM ${var.vm_name} created on Today!' >> ./logs/vm_creation.log"
    interpreter = ["/bin/bash", "-c"]
  }
  
  # Using depends_on to trigger null resource
  depends_on = [
    vsphere_virtual_machine.this
  ]
}
```

## Step-04: Execute Terraform Commands
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
cat ./logs/vm_creation.log
```

## Step-05: Clean-Up Resources
```t
# Terraform Destroy
terraform destroy -auto-approve

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## References
- [Null Provider](https://registry.terraform.io/providers/hashicorp/null/latest/docs)