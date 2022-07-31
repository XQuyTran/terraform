rg_name = "tfLab"
rg_loc = "centralindia"

vmList = [
  {
    "admin_username" = "azureuser"
    "name" = "vm0"
    "size" = "Standard_B1s"
    "os_disk" = {
      "caching" = "None"
      "storage_account_type" = "Standard_LRS"
    }
    "source_image_id" = "UbuntuLTS"
  },

  {
    "admin_username" = "azureuser"
    "name" = "vm1"
    "size" = "Standard_B1s"
    "os_disk" = {
    "caching" = "None"
    "storage_account_type" = "Standard_LRS"
    }
    "source_image_id" = "UbuntuLTS"
  }
]