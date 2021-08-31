variable "resource_environment_dev" {
  default = "Development"
}
variable "resource_group_name" {
  default = "myResourceGroup"
}

variable "resource_location" {
  default = "eastus"
}

variable "resource_virtual_network_name" {
  default = "myVnet"
}

variable "resource_virtual_network_ip" {
  default = "10.0.0.0/16"
}

variable "resource_subnet_name" {
  default = "mySubnet"
}

variable "resource_subnet_ip" {
  default = "10.0.1.0/24"
}

variable "resource_mypublicip_name" {
  default = "myPublicIP"
}

variable "resource_ip_allocation_dynamic_type" {
  default = "Dynamic"
}

variable "resource_mynsgGroup_name" {
  default = "myNSG"
}

variable "resource_rule_access_allow" {
  default = "Allow"
}

variable "resource_target_ip_address_all" {
  default = "*"
}

variable "resource_tcp_protocol_value" {
  default = "Tcp"
}

variable "resource_ssh_protocol_value" {
  default = "SSH"
}

variable "resource_ssh_protocol_port" {
  default = "22"
}

variable "resource_rule_access_Inbound" {
  default = "Inbound"
}

variable "resource_myNIC_name" {
  default = "myNIC"
}

variable "resource_myNic_Configuration" {
  default = "myNicConfiguration"
}

variable "resource_ssh_algorithm_rsa_name" {
  default = "RSA"
}

variable "resource_ssh_algorithm_rsa_bits" {
  default = "4096"
}

variable "resource_vm_name" {
  default = "myVM"
}

variable "resource_vm_size" {
  default = "Standard_B2s"
}

variable "resource_vm_publisher" {
  default = "Canonical"
}

variable "resource_vm_offer" {
  default = "UbuntuServer"
}
variable "resource_vm_sku" {
  default = "18.04-LTS"
}

variable "resource_vm_version" {
  default = "latest"
}

variable "resource_vm_computer_name" {
  default = "aitechVM"
}

variable "resource_vm_admin_user" {
  default = "aitech"
}


variable "resource_os_disc_name" {
  default = "myOsDisk"
}

variable "resource_os_disc_caching" {
  default = "ReadWrite"
}

variable "resource_os_disc_storage_account_type" {
  default = "Premium_LRS"
}

