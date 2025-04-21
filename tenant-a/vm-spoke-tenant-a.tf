# Create a VM Spoke Virtual Network in Tenant A
resource "azurerm_virtual_network" "vma_vnet" {
  name                = "vm-spoke-tenant-a-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vma_vnet_address_space
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vma_vnet.name
  address_prefixes     = var.vma_subnet_address_prefix
}

resource "azurerm_network_interface" "vma" {
  name                = "vma-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "vm-tenant-a"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_F2"
  admin_username                  = "azureuser"
  admin_password                  = var.vma_admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vma.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "vma_links" {
  name                  = "vm-tenanta-vnet-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone["azr.cloud"].name
  virtual_network_id    = azurerm_virtual_network.vma_vnet.id
}