resource "vsphere_virtual_machine" "this" {
  name                   = var.vm_name
  resource_pool_id       = var.resource_pool_id
  datastore_id           = var.datastore_id
  num_cpus               = var.num_cpus
  memory                 = var.memory * 1024
  firmware               = "efi"
  guest_id               = var.guest_id

  network_interface {
    network_id   = var.network_id
    adapter_type = var.adapter_type
  }
  disk {
    label            = "${var.vm_name}-disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    unit_number      = 0
  }

  clone {
    template_uuid = var.template_uuid
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

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/hello.sh",
      "bash /tmp/hello.sh"
    ]
    
    connection {
      type        = "ssh"
      user        = var.ssh_user
      password    = var.ssh_pass
      host        = self.default_ip_address  # Understand what is "self"
    }
  }
}