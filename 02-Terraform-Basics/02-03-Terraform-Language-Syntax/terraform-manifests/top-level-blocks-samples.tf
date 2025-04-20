#####################################################################
# Block-1: Terraform Settings Block
terraform {
  required_version = ">= 0.13"
  required_providers {
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
    }
  }
}
#####################################################################
# Block-2: Provider Block
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
}
#####################################################################
# Block-3: Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  name             = "saleh-vm"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus = 4
  memory   = 10240
...
}
#####################################################################
# Block-4: Input Variables Block
variable "esxi_hostport" {
  default = "22"
  description = "esxi host ssh port"
  type = number
}
#####################################################################
# Block-5: Output Values Block
output "vm_instance_publicip" {
  description = "VM Instance Public IP"
  value = esxi_guest.vmsalehmiri01.public_ip
}
#####################################################################
# Block-6: Local Values Block
# Create S3 Bucket - with Input Variables & Local Values
locals {
  bucket-name-prefix = "${var.app_name}-${var.environment_name}"
}
#####################################################################
# Block-7: Data sources Block
data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}
data "vsphere_compute_cluster" "cluster" {
  name          = "vSAN"
  datacenter_id = data.vsphere_datacenter.dc.id
}
#####################################################################
# Block-8: Modules Block
# New VM Creation Module

module "virtual_machine" {
  source                 = "./modules/provision"
  vm_name                = var.vm_name
  resource_pool_id       = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id           = data.vsphere_datastore.datastore.id
  num_cpus               = var.num_cpus
  memory                 = var.memory
  ...
}
#####################################################################