variable "vnet_name" {
  type = string
  default = ""
}

variable "rg_name" {
  type = string
  default = ""
}

variable "rg_loc" {
  type = string
  default = ""
}

variable "vnet_env" {
  type = string
  default = ""
}

variable "subnet" {
  type = map(string)
  # default = null
}

variable "add_space" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}