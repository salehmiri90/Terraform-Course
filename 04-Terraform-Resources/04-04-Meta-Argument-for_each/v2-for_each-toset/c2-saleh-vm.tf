# Data Block
data "vsphere_datacenter" "dc" {
  name = "Datacenter-lab"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "vSAN-lab"
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

// added in this section
# Variable Block
variable "vm_names" {
  default = ["tosetvm-01", "tosetvm-02", "tosetvm-03"]
}

# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {

  for_each = toset(var.vm_names)
  name     = "saleh-${each.key}"
//
  num_cpus = 1
  memory   = 1024

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id
  guest_id = "otherGuest"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 5
    eagerly_scrub    = false
    thin_provisioned = true
  }
  wait_for_guest_net_timeout  = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout   = 0
}