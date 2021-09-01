# Information d'authentification a azure en utilisant a service principal
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  # Save Terraform State To Remote Location In Azure storage account
  backend "azurerm" {  
    resource_group_name  = "Terraform-rg"  
    storage_account_name = "aitechterraformstate"  
    container_name       = "terraform-state"  
    key                  = "terraform.tfstate"  
  }  
}

provider "azurerm" {
  features {}
}

# creation du ressource group azure
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.resource_location
  
  tags = {
    environment = var.resource_environment
  }
}

# Creation du virtual network
resource "azurerm_virtual_network" "myVnet" {
  name = var.resource_virtual_network_name
  address_space = [ var.resource_virtual_network_ip ]
  location = var.resource_location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = var.resource_environment
  }
}

# Creation d'un subnet
resource "azurerm_subnet" "mySubnet" {
  name = var.resource_subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myVnet.name
  address_prefixes = [ var.resource_subnet_ip]
}

# Creation d'une addresse ip public
resource "azurerm_public_ip" "myPublicIP" {
  name = var.resource_mypublicip_name
  location = var.resource_location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = var.resource_ip_allocation_dynamic_type
  tags = {
    environment = var.resource_environment
  }
}

# Creation d'un network security group et d'une regle de filtrage
resource "azurerm_network_security_group" "myNSG" {
  name = var.resource_mynsgGroup_name
  location = var.resource_location
  resource_group_name = azurerm_resource_group.rg.name
  
  security_rule {
    access = var.resource_rule_access_allow
    description = "Opening the ssh stream"
    destination_address_prefix = var.resource_target_ip_address_all
    destination_port_range = var.resource_ssh_protocol_port
    direction = var.resource_rule_access_Inbound
    name = var.resource_ssh_protocol_value
    priority = 1001
    protocol = var.resource_tcp_protocol_value
    source_address_prefix = var.resource_target_ip_address_all
    source_port_range = var.resource_target_ip_address_all
    }
   tags = {
    environment = var.resource_environment
  }
}

# Creation d'une interface reseau
resource "azurerm_network_interface" "myNIC" {
  name = var.resource_myNIC_name
  location = var.resource_location
  resource_group_name = azurerm_resource_group.rg.name
  # On attache l'interface reseau au l'ip public
  # On attache l'interface reseau au subnet
  ip_configuration {
    name = var.resource_myNic_Configuration
    subnet_id = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = var.resource_ip_allocation_dynamic_type
    public_ip_address_id = azurerm_public_ip.myPublicIP.id
  }
  tags = {
    environment = var.resource_environment
  }
}

# Attachement du NSG a l'interface reseau NIC
resource "azurerm_network_interface_security_group_association" "nsg_nic_association" {
  network_interface_id = azurerm_network_interface.myNIC.id
  network_security_group_id = azurerm_network_security_group.myNSG.id
}

#Creation d'une ssh
resource "tls_private_key" "key_ssh" {
  algorithm = var.resource_ssh_algorithm_rsa_name
  rsa_bits = var.resource_ssh_algorithm_rsa_bits
}

# Creation d'une machine virtuel
resource "azurerm_linux_virtual_machine" "myVM" {
  name =  var.resource_vm_name
  location = var.resource_location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [ azurerm_network_interface.myNIC.id ]
  size = var.resource_vm_size
  os_disk {
        name              = var.resource_os_disc_name
        caching           = var.resource_os_disc_caching
        storage_account_type = var.resource_os_disc_storage_account_type
    }
  source_image_reference {
        publisher = var.resource_vm_publisher
        offer     = var.resource_vm_offer
        sku       = var.resource_vm_sku
        version   = var.resource_vm_version
    }

    computer_name  = var.resource_vm_computer_name
    admin_username = var.resource_vm_admin_user
    disable_password_authentication = true

    admin_ssh_key {
        username       = var.resource_vm_admin_user
        public_key     = tls_private_key.key_ssh.public_key_openssh
    }
  tags = {
    environment = var.resource_environment
  }
}