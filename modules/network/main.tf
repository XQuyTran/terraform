resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = var.rg_name
  location = var.rg_loc

  address_space = var.add_space

  tags = {
    "environment" = var.vnet_env
  }
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet

  name = each.key
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = tolist([each.value])
}

resource "azurerm_public_ip" "bastion-ip" {
  name = "bastion-ip"
  resource_group_name = var.rg_name
  location = var.rg_loc
  allocation_method = "Dynamic"
}

resource "azurerm_bastion_host" "azbastion" {
  # count = azurerm_subnet.subnet.name == "subnet-a" ? 1 : 0

  name = "bastion-sub-a"
  resource_group_name = var.rg_name
  location = var.rg_loc

  ip_configuration {
    name = "sub-a-bastion-config"
    subnet_id = azurerm_subnet.subnet["subnet-a"].id
    public_ip_address_id = azurerm_public_ip.bastion-ip.id
  }
}