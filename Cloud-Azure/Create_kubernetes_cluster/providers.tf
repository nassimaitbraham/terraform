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
    container_name       = "kubernetes-terraform-state"  
    key                  = "terraform.tfstate"  
  }  
}

provider "azurerm" {
  features {}
}