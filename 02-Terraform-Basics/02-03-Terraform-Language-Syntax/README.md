# Terraform Configuration Language Syntax

## Step-01: Introduction
- Understand Terraform Language Basics
  - Understand Blocks
  - Understand Arguments, Attributes & Meta-Arguments
  - Understand Identifiers
  - Understand Comments
  


## Step-02: Terraform Configuration Language Syntax
- Understand Blocks
- Understand Arguments
- Understand Identifiers
- Understand Comments
- Understand Datatypes
- [Terraform Configuration](https://www.terraform.io/docs/configuration/index.html)
- [Terraform Configuration Syntax](https://www.terraform.io/docs/configuration/syntax.html)
```t
# Template
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>"   {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}

# VMware Example
resource "vsphere_virtual_machine" "saleh_vm" { # BLOCK
  name             = "saleh-vm" # Argument
  datastore_id     = data.vsphere_datastore.ds.id # Argument with value as expression (Variable value replaced from varibales.tf
  ...
}
```

## Step-03: Terraform Comments

- One line comment

```
# This resource creates a virtual machine
resource "vsphere_virtual_machine" "web" {
  name = "web-server"
  // Memory size in MB
  memory = 2048
}
```

- Multi line comment

```
/*
  This block creates a VM in the staging environment.
  It uses the vsphere provider and connects to a custom network.
*/
resource "vsphere_virtual_machine" "staging" {
  name = "stage-vm"
  memory = 4096
}
```

# Datatypes Example
```
type = "string"
number = 2
boolean = true  # true or flase

List:
list1 = ["item1", "item2", "item3"]

Maps:
map1 = {key1 = "value1", key2 = "value2" , key3 = "value3"}

locals {
  my_map =  {"name" = "saleh miri" , "age" = 30, "is_admin" = true}
}

locals.my_map["age"]
```

## Step-03: Understand about Arguments, Attributes and Meta-Arguments.
- Arguments can be `required` or `optional`
- Attribues format looks like `resource_type.resource_name.attribute_name`
- Meta-Arguments change a resource type's behavior (Example: count, for_each)
- [Additional Reference](https://learn.hashicorp.com/tutorials/terraform/resource?in=terraform/configuration-language) 
- [Resource: Meta-Arguments](https://www.terraform.io/docs/language/meta-arguments/depends_on.html)

## Step-04: Understand about Terraform Top-Level Blocks
- Discuss about Terraform Top-Level blocks
  - Terraform Settings Block
  - Provider Block
  - Resource Block
  - Input Variables Block
  - Output Values Block
  - Local Values Block
  - Data Sources Block
  - Modules Block

