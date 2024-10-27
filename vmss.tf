resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = "example-vmss"  # Name of the VMSS. Change "example-vmss" to your desired VMSS name.
  location            = azurerm_resource_group.example.location  # Location of the VMSS, same as the resource group.
  resource_group_name = azurerm_resource_group.example.name      # Resource group where the VMSS will be created.
  sku                 = "Standard_DS1_v2"  # VM size. Change "Standard_DS1_v2" to your desired VM size.
  instances           = 2  # Number of VM instances. Change this number to scale the number of VMs.
  admin_username      = "adminuser"  # Admin username for the VMs. Change "adminuser" to your desired username.
  admin_password      = "Password1234!"  # Admin password for the VMs. Change "Password1234!" to your desired password.
  disable_password_authentication = false  # Ensure password authentication is enabled

  # Define the source image for the VM
  source_image_reference {
    publisher = "Canonical"  # Publisher of the image. Change if you want a different OS.
    offer     = "UbuntuServer"  # Offer of the image. Change if you want a different OS.
    sku       = "18.04-LTS"  # SKU of the image. Change if you want a different version.
    version   = "latest"  # Version of the image. Change if you want a specific version.
  }

  # Network interface configuration
  network_interface {
    name    = "example-nic"  # Name of the network interface. Change "example-nic" to your desired NIC name.
    primary = true  # Indicates that this is the primary network interface.

    # IP configuration for the network interface
    ip_configuration {
      name      = "internal"  # Name of the IP configuration. Change "internal" to your desired configuration name.
      subnet_id = azurerm_subnet.example.id  # Subnet where the network interface will be created.
    }
  }

  # OS disk configuration
  os_disk {
    caching              = "ReadWrite"  # Caching mode for the OS disk. Change if needed.
    storage_account_type = "Standard_LRS"  # Storage account type for the OS disk. Change if needed.
  }

  computer_name_prefix = "examplevm"  # Prefix for the VM names. Change "examplevm" to your desired prefix.
}