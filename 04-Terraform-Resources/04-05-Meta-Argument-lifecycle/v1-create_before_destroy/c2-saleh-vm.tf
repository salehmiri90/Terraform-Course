# Data Block
data "vsphere_datacenter" "dc" {
  name = "Datacenter-lab"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "vSAN-lab"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "ds" {
  // change datastore name from datastore1 to datastore2
  name          = "vsanDatastore" 
  # name         = "datastore2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}
  
# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  name     = "saleh-lifecycle1"
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
  // added in this section
  lifecycle {
    create_before_destroy = true
  }
  //
}