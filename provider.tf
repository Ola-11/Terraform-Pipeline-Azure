# Create a Terraform configuration with a backend configuration block.
# Our Terraform State file will be stored in Azure

#############################################################################
# TERRAFORM CONFIGURATION AND PROVIDER
#############################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.75"
    }
  }
  backend "azurerm" {
      resource_group_name  = "RG-Project10"
      storage_account_name  = "newproj121007860"
      container_name        = "blob-proj10"
      key                    = "SVjHLNYucmw03YSlFj7UpWx9pf5kgpRhMoTli+oFlEU/DzDGynI/PrYbgx6FR8DopZDvXpdsVu4E+AStMMYWvA=="        
  }
  
  }

