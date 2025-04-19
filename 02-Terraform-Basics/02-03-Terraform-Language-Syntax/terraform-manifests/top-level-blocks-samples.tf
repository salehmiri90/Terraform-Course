#####################################################################
# Block-1: Terraform Settings Block
terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
  }
}
#####################################################################
# Block-2: Provider Block
provider "esxi" {
  esxi_hostname = "192.168.1.10"
  esxi_hostport = "22"
  esxi_hostssl  = "443"
  esxi_username = "root"
  esxi_password = "password"
}
#####################################################################
# Block-3: Resource Block
resource "esxi_guest" "vmsalehmiri01" {
  guest_name = "vmsalehmiri01"
  disk_store = "DS_001"
  network_interfaces {
    virtual_network = "VM Network"
  }
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
data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
#####################################################################
# Block-8: Modules Block
# New VM Creation Module

module "vm" {
  source                 = "./modules/provision"
  vm_name                = var.vm_name
  resource_pool_id       = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id           = data.vsphere_datastore.datastore.id
  num_cpus               = var.num_cpus
  memory                 = var.memory
}
#####################################################################