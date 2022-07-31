variable "rg_name" {
  type = string
  default = ""
}

variable "rg_loc" {
  type = string
  default = ""
}

variable "vmList" {
  type = list(object({
    admin_username = string
    name = string
    size = string
    os_disk = object({
      caching = string
      storage_account_type = string
    })
    source_image_id = string
  }))
  
  default = null
}