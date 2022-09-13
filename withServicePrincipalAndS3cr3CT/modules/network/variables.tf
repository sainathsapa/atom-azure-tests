variable "nsg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)

}

variable "vnet_dns_servers" {
  type = list(string)
}

variable "dns_zone_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_address_prifix" {
  type = list(string)
}

variable "pip_name" {
  type = string
}

variable "pip_alloc_method" {
  type = string
}

variable "az_lb_name" {
  type = string
}

variable "pvt_lnk_service_name" {
  type = string
}

variable "pvt_lnk_service_k8s_ip" {
  type = number
}

variable "db_subnet_name" {
  type = string
}

variable "db_subnet_address_prefix" {
  type = list(string)
}

variable "db_action" {
  type    = list(string)
  default = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
}
