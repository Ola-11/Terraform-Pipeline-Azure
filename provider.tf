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
      storage_account_name  = "newproj1638639102"
      container_name        = "blob-proj10"
      key                    = "Q8ANz+fgMtNrx/gqm8ALXD36qzdQMxzhOAt7dCGynPF+kGrYUJLIIiWhPCg1BFCmxIqNyK9gv0BA+AStW19k2Q=="        
  }
  
  }

