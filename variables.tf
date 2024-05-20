#############################################################################
# VARIABLES
#############################################################################

variable "vm_name" {
  default = "vm-web-inwayz02"
}

variable "location"{
    default = "East US"
}

variable "resource_group"{
    default = "rg-soladeinde-training-cc-001"
}

variable "vnet_name"{
    default = "vnet-dev-web-001"
}

variable "address_space"{
    default = ["10.0.0.0/16"]
}

variable "address_prefixes"{
    default = ["10.0.0.0/24"]
}

variable "vm_size"{
    default = "Standard_B2s"
}

variable "admin_username"{
    default = "adminuser"
}

variable "admin_password"{
    default = "Pol@Mas65210#@"
}

variable "public_ip"{
    default = "pip-web-inwayz02"
}

variable "network_security_group"{
    default = "nsg-vm-web-inwayz02"
}
