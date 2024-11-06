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
      storage_account_name = "inwayztfstate1248310649"
      container_name       = "inwayztfstate"
      key                  = "d905iyQFg6g2/lExrzOT7kMiektbBXGPGtwKRHwYI6qw04/qFYasGKxYFSWtpRwj7ix+b0eBvCCO+AStknMySg=="
  }
}

provider "azurerm"
  features {}
}
