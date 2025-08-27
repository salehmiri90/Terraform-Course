# Lets have fun on VMware!

# Terraform Settings Block
terraform {
  required_version = ">= 0.13"
  required_providers {
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
      version = "2.8.1"
    }
  }
}

# Provider Block
provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "1.2.3.4"
  allow_unverified_ssl = true
}

# Data Block
data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "vSAN"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "ds" {
  name          = "vsanDatastore"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  name             = "saleh-vm"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus = 4
  memory   = 10240

  guest_id = "otherGuest"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
  }
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout = 0
}
