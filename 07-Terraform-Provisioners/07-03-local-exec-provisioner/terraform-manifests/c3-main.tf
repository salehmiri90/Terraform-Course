resource "vsphere_virtual_machine" "this" {
  name                   = var.vm_name
  resource_pool_id       = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id           = data.vsphere_datastore.datastore.id
  num_cpus               = var.num_cpus
  memory                 = var.memory * 1024
  firmware               = "efi"
  guest_id               = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "${var.vm_name}-disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    unit_number      = 0
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.uuid
    timeout       = 600

    customize {
      linux_options {
        host_name = var.vm_os_hostname
        domain    = var.vm_os_domain_name
      }

      network_interface {
        ipv4_address = var.ipv4_address
        ipv4_netmask = var.ipv4_netmask
      }

      ipv4_gateway    = var.ipv4_gateway
    }
  }

  provisioner "local-exec" {
    command = "echo 'VM ${self.name} created on Today!' >> ./logs/vm_creation.log && false"
  }
  
}