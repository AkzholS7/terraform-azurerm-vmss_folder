


resource "azurerm_linux_virtual_machine_scale_set" "scale-set" {
  name                            = "${var.name}-vmss"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = "Standard_B1s"
  instances                       = 1
  admin_username                  = "akzhol"
  admin_password                  = "Akzhol@1234567"
  disable_password_authentication = false
  custom_data                     = var.custom_data

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                      = "nic-akzhol"
    primary                   = true
    network_security_group_id = var.nsg_id

    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [var.load_balancer_backend_address_pool_ids]
      load_balancer_inbound_nat_rules_ids    = [var.load_balancer_inbound_nat_rules_ids]

    }
  }
}