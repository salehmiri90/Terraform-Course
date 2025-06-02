# Terraform Input Variables

## Step-00: Introduction
- **v1:** Input Variables - Basics
- **v2:** Provide Input Variables when prompted during terraform plan or apply
- **v3:** Override default variable values using CLI argument `-var` 
- **v4:** Override default variable values using Environment Variables
- **v5:** Provide Input Variables using `terraform.tfvars` files
- **v6:** Provide Input Variables using `<any-name>.tfvars` file with CLI 
argument `-var-file`
- **v7:** Provide Input Variables using `auto.tfvars` files
- **v8-01:** Implement complex type constructors like `list` 
- **v8-02:** Implement complex type constructors like `maps`
- **v9:** Implement Custom Validation Rules in Variables
- **v10:** Protect Sensitive Input Variables
- **v11:** Understand about `File` function

## Pre-requisite
- Terraform >= 1.8.0
- Access to a vCenter/ESXi environment
- Proper credentials with permission to create VMs
- Static IP or DHCP available for network assignment (if needed)

# Terraform Input Variables - Hands-on Labs with vSphere

This repository contains practical examples and scenarios to help you learn and master **Terraform Input Variables** in real-world VMware vSphere environments. Each subdirectory represents a step-by-step lab focused on a specific feature of input variables.

> ✅ Tested with **Terraform v1.8.4** and **vsphere provider v2.8.1**

---

## 📚 Covered Topics

### 1. Input Variables - Basics
- Declaring input variables
- Referencing variables in resource blocks
- Removing default values to prompt for input at runtime

### 2. Provide Input Variables Interactively
- Assign variable values when prompted via `terraform apply`

### 3. Override Variable Values via CLI Argument
- Using `-var` option to override default values

### 4. Use Environment Variables
- Assigning variable values using shell environment variables like `TF_VAR_<variable_name>`

### 5. Use `terraform.tfvars` File
- Storing input values in a default `.tfvars` file

### 6. Use `<any-name>.tfvars` with `-var-file`
- Organizing different environments using named tfvars files (e.g., `dev.tfvars`, `prod.tfvars`)

### 7. Use `*.auto.tfvars` File
- Automatically loading variable values from files ending in `.auto.tfvars`

### 8. Complex Variable Types (List & Map)
- Defining and using `list` and `map` variable types
- Example: Assigning a list of disk sizes for a VM

### 9. Custom Validation Rules
- Implementing validation rules to restrict allowed input values
- Example: Validating CPU count is within a specific range

### 10. Sensitive Input Variables
- Marking variables as sensitive to hide them in CLI output
- Example: Password or secret keys

- **Reference Sub folder:** v10-Sensitive-Input-Variables
- When using environment variables to set sensitive values, keep in mind that those values will be in your environment and command-line history
`Example: export TF_VAR_db_username=admin TF_VAR_db_password=adifferentpassword`
- When you use sensitive variables in your Terraform configuration, you can use them as you would any other variable. 
- Terraform will `redact` these values in command output and log files, and raise an error when it detects that they will be exposed in other ways.
- **Important Note-1:** Never check-in `secrets.tfvars` to git repositories
- **Important Note-2:** Terraform state file contains values for these sensitive variables `terraform.tfstate`. You must keep your state file secure to avoid exposing this data.


### 11. Using the `file()` Function
- Reading external text files (e.g., SSH public keys, config scripts) and passing their content as variables
- **Reference Sub folder:** v11-File-Function
- Understand about [Terraform File Function](https://www.terraform.io/docs/language/functions/file.html)


## 🧪 How to Run Labs

Each folder (e.g., `v01`, `v02`, ...) contains a separate lab with:
- Terraform config files (`.tf`)
- Optionally a `*.tfvars` file
- A focused use-case or concept

### Example:
```
cd v04-Input-Variables-Override-with-Environment-Variables
```

# Export variable as environment variable
```
export TF_VAR_vm_cpu=4

terraform init
terraform plan
terraform apply
```

## References
- [Terraform Variable Definition Precedence](https://www.terraform.io/docs/language/values/variables.html#variable-definition-precedence)
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)
security_group)
- [Sensitive Variables - Additional Reference](https://learn.hashicorp.com/tutorials/terraform/sensitive-variables)
