variable "resource_environment" {
  description = "variable to define the type of environment"
}
variable "resource_group_name" {
  description = "Azure resource groupe name"
}

variable "resource_location" {
  description = "Resource location"
}

variable "resource_central_vnet_name" {
  description = "Central virtual network that contains the firewall"
}

variable "resource_central_vnet_ip" {
  description = "IP range of central virtual network that contains the firewall"
}

variable "resource_firewall_subnet_name" {
 description = "Firewall subnet name" 
}

variable "resource_firewall_subnet_ip" {
  description = "IP range of firewall subnet"
}

variable "resource_firewallippublic_name" {
  description = "Name of firewall public ip"
}

variable "resource_ip_allocation_static_type" {
  description = "IP allocation type"
}

variable "resource_sku_type" {
  description = "SKU"
}

variable "resource_azure_firewall" {
  description = "name of azure firewall"
}

variable "azurefirewall_ip_configuration_name" {
  description = "name of azure firewall ip configuration"
}