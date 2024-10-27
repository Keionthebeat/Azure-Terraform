# Create a Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"  # Name of the resource group. Change "example-resources" to your desired resource group name.
  location = "East US"            # Location of the resource group. Change "East US" to your desired Azure region.
}

# Create a Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"  # Name of the virtual network. Change "example-vnet" to your desired virtual network name.
  address_space       = ["10.0.0.0/16"] # Address space for the virtual network. Change the CIDR block if needed.
  location            = azurerm_resource_group.example.location  # Location of the virtual network, same as the resource group.
  resource_group_name = azurerm_resource_group.example.name      # Resource group where the virtual network will be created.
}

# Create a Subnet
resource "azurerm_subnet" "example" {
  name                 = "example-subnet"  # Name of the subnet. Change "example-subnet" to your desired subnet name.
  resource_group_name  = azurerm_resource_group.example.name  # Resource group where the subnet will be created.
  virtual_network_name = azurerm_virtual_network.example.name # Virtual network where the subnet will be created.
  address_prefixes     = ["10.0.1.0/24"]   # Address prefix for the subnet. Change the CIDR block if needed.
}