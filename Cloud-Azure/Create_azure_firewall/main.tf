resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.resource_location
  tags = {
    environment = var.resource_environment
  }
}

# Creation du central virtual network
resource "azurerm_virtual_network" "centralVNet" {
  name = var.resource_central_vnet_name
  address_space = [ var.resource_central_vnet_ip ]
  location = var.resource_location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = var.resource_environment
  }
}

# Creation d'un subnet pour le firewall
resource "azurerm_subnet" "AzureFirewallSubnet" {
  name = var.resource_firewall_subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.centralVNet.name
  address_prefixes = [ var.resource_firewall_subnet_ip]
}

# Creation d'une adresse ip public pour le firewall
resource "azurerm_public_ip" "firewallIPPublic" {
  name = var.resource_firewallippublic_name
  location = var.resource_location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = var.resource_ip_allocation_static_type
  sku = var.resource_sku_type
  tags = {
    environment = var.resource_environment
  }
}

# deploiment du azure firewall
resource "azurerm_firewall" "azureFirewall" {
  depends_on=[azurerm_public_ip.firewallIPPublic]
  name = var.resource_azure_firewall
  resource_group_name = azurerm_resource_group.rg.name
  location = var.resource_location
  ip_configuration {
    name = var.azurefirewall_ip_configuration_name
    subnet_id = azurerm_subnet.AzureFirewallSubnet.id
    public_ip_address_id = azurerm_public_ip.firewallIPPublic.id
  }
  tags = {
    environment = var.resource_environment
  }
}