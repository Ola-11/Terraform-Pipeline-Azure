#############################################################################
# VARIABLES
#############################################################################

variable "vm_name" {
  default = "vm-proj-10"
}

variable "location"{
    default = "East US"
}

variable "resource_group"{
    default = "RG-Project10"
}

variable "vnet_name"{
    default = "vnet-proj-10"
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
    default = "adminuser"
}

variable "public_ip"{
    default = "pip-proj-10"
}

variable "network_security_group"{
    default = "nsg-proj-10"
}
