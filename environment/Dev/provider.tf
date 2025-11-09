terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
  
  #backend "azurerm" {
    #storage_account_name = "devstorage176g2345"
    #resource_group_name  = "Dev-E3-RG"
    #container_name       = "devcontainer"
    #key                  = "dev.terraform.tfstate-v6"
  #}
}

provider "azurerm" {
  features {}
  subscription_id = "fd3248c3-0ad4-4c22-98a3-9ce68d0ec4bd"
}
