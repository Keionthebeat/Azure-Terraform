# Define the provider for Azure
provider "azurerm" {
  features {}  # This block is required but can be left empty

  subscription_id = var.subscription_id  # Azure subscription ID
  client_id       = var.client_id        # Azure client ID
  client_secret   = var.client_secret    # Azure client secret
  tenant_id       = var.tenant_id        # Azure tenant ID
}

# Define the variables for the provider configuration
variable "subscription_id" {
  description = "The subscription ID for Azure"
}

variable "client_id" {
  description = "The client ID for Azure"
}

variable "client_secret" {
  description = "The client secret for Azure"
}

variable "tenant_id" {
  description = "The tenant ID for Azure"
}