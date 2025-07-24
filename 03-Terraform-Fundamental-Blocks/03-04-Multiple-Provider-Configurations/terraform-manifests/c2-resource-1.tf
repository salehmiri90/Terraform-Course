# Resource Block to Create VM in Cluster1 which uses default provider
resource "vsphere_virtual_machine" "resource1_vm" {
  name             = "resource1_vm"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus = 1
  memory   = 1024

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
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout = 0
}

