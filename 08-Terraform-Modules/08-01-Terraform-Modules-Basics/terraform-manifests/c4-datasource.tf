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
