# Resource Block to Create VM in Cluster2
resource "vsphere_virtual_machine" "resource2_vm" {
  name             = "resource2_vm"
  provider         = vsphere.cluster2
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus = 2
  memory   = 2048

  guest_id = "otherGuest"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 10
    eagerly_scrub    = true
    thin_provisioned = false
  }
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout = 0
}


/*
Additional Note: 
provider = <PROVIDER NAME>.<ALIAS>  # This is a Meta-Argument from Resources Section nothing but a Special Argument
*/