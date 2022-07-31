resource "azurerm_network_interface" "vmnic" {
  name = var.nic_name
  resource_group_name = var.rg_name
  location = var.rg_loc
  ip_configuration {
    name = var.nic_name
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux-vms" {
  resource_group_name = var.rg_name
  location = var.rg_loc
  
  name = vm["name"]
  admin_username = vm["admin_username"]
  size = vm["size"]
  network_interface_ids = azurerm_network_interface.vmnic.id
  os_disk {
    caching = vm["os_disk"]["caching"]
    storage_account_type = vm["os_disk"]["storage_account_type"]
  }
  source_image_id = vm["source_image_id"]
}