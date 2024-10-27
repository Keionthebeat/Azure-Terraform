# Create a Load Balancer
resource "azurerm_lb" "example" {
  name                = "example-lb"  # Name of the load balancer. Change "example-lb" to your desired load balancer name.
  location            = azurerm_resource_group.example.location  # Location of the load balancer, same as the resource group.
  resource_group_name = azurerm_resource_group.example.name      # Resource group where the load balancer will be created.
  sku                 = "Standard"  # SKU of the load balancer. Change if needed.

  frontend_ip_configuration {
    name                 = "example-frontend"  # Name of the frontend IP configuration. Change if needed.
    public_ip_address_id = azurerm_public_ip.example.id  # ID of the public IP address.
  }
}

# Create a Public IP Address for the Load Balancer
resource "azurerm_public_ip" "example" {
  name                = "example-pip"  # Name of the public IP address. Change "example-pip" to your desired name.
  location            = azurerm_resource_group.example.location  # Location of the public IP address, same as the resource group.
  resource_group_name = azurerm_resource_group.example.name      # Resource group where the public IP address will be created.
  allocation_method   = "Static"  # Allocation method for the public IP address. Change if needed.
  sku                 = "Standard"  # SKU of the public IP address. Change if needed.
}

# Create a Backend Address Pool for the Load Balancer
resource "azurerm_lb_backend_address_pool" "example" {
  name            = "example-bap"  # Name of the backend address pool. Change "example-bap" to your desired pool name.
  loadbalancer_id = azurerm_lb.example.id  # ID of the load balancer.
}

# Create a Health Probe for the Load Balancer
resource "azurerm_lb_probe" "example" {
  name            = "example-probe"  # Name of the health probe. Change "example-probe" to your desired probe name.
  loadbalancer_id = azurerm_lb.example.id  # ID of the load balancer.
  protocol        = "Tcp"  # Protocol for the health probe. Change if needed.
  port            = 80  # Port for the health probe. Change if needed.
}

# Create a Load Balancer Rule
resource "azurerm_lb_rule" "example" {
  name                           = "example-rule"  # Name of the load balancer rule. Change "example-rule" to your desired rule name.
  loadbalancer_id                = azurerm_lb.example.id  # ID of the load balancer.
  protocol                       = "Tcp"  # Protocol for the load balancer rule. Change if needed.
  frontend_port                  = 80  # Frontend port for the load balancer rule. Change if needed.
  backend_port                   = 80  # Backend port for the load balancer rule. Change if needed.
  frontend_ip_configuration_name = azurerm_lb.example.frontend_ip_configuration[0].name  # Frontend IP configuration name.
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.example.id]  # List of backend address pool IDs.
  probe_id                       = azurerm_lb_probe.example.id  # ID of the health probe.
}