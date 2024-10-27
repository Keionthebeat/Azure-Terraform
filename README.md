# Azure Terraform VM Project

## Overview

This project demonstrates how to deploy an autoscaling infrastructure for an Apache web service on Azure using Terraform. The infrastructure includes a Virtual Machine Scale Set (VMSS), a Load Balancer, and monitoring with autoscaling based on CPU metrics.

## Business Solution

The solution aims to provide a scalable and highly available web service infrastructure. By using a VMSS, the number of VM instances can automatically scale based on demand, ensuring optimal performance and cost-efficiency. The Load Balancer distributes incoming traffic across the VM instances, improving load distribution and reliability. Monitoring and autoscaling are implemented to automatically adjust the number of VM instances based on CPU usage, reducing operational costs.

## Step-by-Step Guide Overview

This section provides a detailed guide on how to set up and deploy the autoscaling infrastructure for an Apache web service on Azure using Terraform. Follow these steps to get started:

1. **Prerequisites**:
   - Install Terraform and Azure CLI.
   - Authenticate your Azure CLI.

2. **Setup**:
   - Clone the repository.
   - Create a Service Principal in Azure.
   - Update the `terraform.tfvars` file with your Azure credentials.

3. **Deployment**:
   - Initialize Terraform.
   - Plan the deployment.
   - Apply the configuration to create the resources in Azure.

4. **Viewing Resources**:
   - Log in to the Azure Portal.
   - Navigate to the Resource Groups.
   - Select your resource group to view the created resources.

5. **Destroying Resources**:
   - Use Terraform to destroy the resources when they are no longer needed.

### Prerequisites

1. **Install Terraform**: Download and install Terraform from the [official website](https://www.terraform.io/downloads.html).
2. **Install Azure CLI**: Download and install the Azure CLI from the [official website](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
3. **Authenticate Azure CLI**: Open a terminal and run `az login` to authenticate your Azure account.

### File Descriptions

#### provider.tf
Defines the Azure provider and sets up the necessary authentication using variables for subscription ID, client ID, client secret, and tenant ID.

#### main.tf
Contains the main resources like Resource Group, Virtual Network, and Subnet.

#### vmss.tf
Defines the Virtual Machine Scale Set (VMSS) configuration, including the VM size, number of instances, admin credentials, and network interface settings.

#### lb.tf
Configures the Load Balancer, including the frontend IP configuration, backend address pool, health probe, and load balancing rule.

#### monitoring.tf
Sets up the Log Analytics Workspace and Autoscale Settings to monitor and automatically scale the VM instances based on CPU usage.

#### terraform.tfvars
Stores the values for the variables used in the provider configuration, such as subscription ID, client ID, client secret, and tenant ID.