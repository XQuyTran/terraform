resource "azurerm_resource_group" "tfLab" {
  name = var.rg_name
  location = var.rg_loc
}

module "dev-vnet" {
  source = "./modules/network"

  vnet_name = "DevVnet"
  rg_name = azurerm_resource_group.tfLab.name
  rg_loc = azurerm_resource_group.tfLab.location
  add_space = ["172.16.0.0/16"]
  vnet_env = "Dev"

  subnet = zipmap(["subnet-a", "subnet-b", "subnet-c"], cidrsubnets("172.16.0.0/16", 8, 8, 8))
}

module "dev-vms" {
  source = "./modules/vm"

  rg_name = azurerm_resource_group.tfLab.name
  rg_loc = azurerm_resource_group.tfLab.location
  
  subnet_id = module.dev-vnet.subnet_id["subnet-b"]
  # nic_name = ["vma", "vmb"]
  # vmList = var.vmList
  
}

# module "staging-vnet" {
#   source = "./modules/network"

#   vnet_name = "StageVnet"
#   rg_name = azurerm_resource_group.tfLab.name
#   rg_loc = azurerm_resource_group.tfLab.location
#   add_space = ["172.17.0.0/16"]
#   vnet_env = "Stage"
# }

# module "stage-subnets" {
#   source = "./network"
  
#   subnet = zipmap(["subnet-a", "subnet-b", "subnet-c"], cidrsubnets("172.17.0.0/16", 8, 8, 8))
# }