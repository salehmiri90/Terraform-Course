# Terraform Provisioners

## Step-00: Provisioner Concepts
- Generic Provisioners
  - file
  - local-exec
  - remote-exec
- Provisioner Connections
- Provisioner Without a Resource  (Null Resource)

## Pre-requisites
- Create a hello-world script with name `hello.sh` and copy it in the folder `scripts` in `terraform-manifest` folder
- Connection Block for provisioners uses this to connect to newly created VM instance to copy files using `file provisioner`.

## Step-01: Introduction
- Understand about File Provisioners
- Create Provisioner Connections block required for File Provisioners

## Step-02: File Provisioner & Connection Block
- **Referencec Sub-Folder:** terraform-manifests
- Understand about file provisioner & Connection Block
- **Connection Block**
  - We can have connection block inside resource block for all provisioners 
  -[or] We can have connection block inside a provisioner block for that respective provisioner
- **Self Object**
  - **Important Technical Note:** Resource references are restricted here because references create dependencies. Referring to a resource by name within its own block would create a dependency cycle.
  - Expressions in provisioner blocks cannot refer to their parent resource by name. Instead, they can use the special **self object.**
  - The **self object** represents the provisioner's parent resource, and has all of that resource's attributes. 

```t
  # Independent File Block for uploading file to VM Instance
  provisioner "file" {
    source      = "scripts/hello.sh"
    destination = "/tmp/hello.sh"
  }

  # Independent remote-exec Block for executing commands on the VM Instance
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/hello.sh",
      "bash /tmp/hello.sh"
    ]
  }

  # Independent Connection Block for Provisioners to connect to VM Instance
  connection {
    type        = "ssh"
    user        = var.ssh_user
    password    = var.ssh_pass
    host        = self.default_ip_address # Understand what is "self"
  }
```

## Step-03: Create Resources using Terraform commands

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

# Verify - Login to VM Instance
cd /tmp
ls -lrta /tmp
cat /tmp/hello.sh
cat /tmp/result.txt

# Clean-up
terraform destroy -auto-approve
rm -rf .terraform* terraform.tfstate*
```