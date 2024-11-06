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
  
  }
}
