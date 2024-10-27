# Create a Log Analytics Workspace for monitoring
resource "azurerm_log_analytics_workspace" "example" {
  name                = "example-law"  # Name of the log analytics workspace. Change "example-law" to your desired workspace name.
  location            = azurerm_resource_group.example.location  # Location of the workspace, same as the resource group.
  resource_group_name = azurerm_resource_group.example.name      # Resource group where the workspace will be created.
  sku                 = "PerGB2018"  # SKU of the workspace. Change if needed.
  retention_in_days   = 30  # Retention period for the logs. Change if needed.
}

# Create Autoscale Settings
resource "azurerm_monitor_autoscale_setting" "example" {
  name                = "example-autoscale"  # Name of the autoscale setting. Change "example-autoscale" to your desired setting name.
  location            = azurerm_resource_group.example.location  # Location of the autoscale setting, same as the resource group.
  resource_group_name = azurerm_resource_group.example.name      # Resource group where the autoscale setting will be created.
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.example.id  # ID of the VMSS to be autoscaled.

  profile {
    name = "defaultProfile"  # Name of the autoscale profile. Change if needed.

    capacity {
      default = 2  # Default number of instances. Change if needed.
      minimum = 1  # Minimum number of instances. Change if needed.
      maximum = 5  # Maximum number of instances. Change if needed.
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"  # Metric to trigger autoscaling. Change if needed.
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.example.id  # ID of the VMSS.
        time_grain         = "PT1M"  # Time grain for the metric. Change if needed.
        statistic          = "Average"  # Statistic type. Change if needed.
        time_window        = "PT5M"  # Time window for the metric. Change if needed.
        time_aggregation   = "Average"  # Time aggregation type. Change if needed.
        operator           = "GreaterThan"  # Operator for the metric. Change if needed.
        threshold          = 75  # Threshold for the metric. Change if needed.
      }

      scale_action {
        direction = "Increase"  # Direction of scaling. Change if needed.
        type      = "ChangeCount"  # Type of scaling action. Change if needed.
        value     = 1  # Value for the scaling action. Change if needed.
        cooldown  = "PT1M"  # Cooldown period. Change if needed.
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"  # Metric to trigger autoscaling. Change if needed.
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.example.id  # ID of the VMSS.
        time_grain         = "PT1M"  # Time grain for the metric. Change if needed.
        statistic          = "Average"  # Statistic type. Change if needed.
        time_window        = "PT5M"  # Time window for the metric. Change if needed.
        time_aggregation   = "Average"  # Time aggregation type. Change if needed.
        operator           = "LessThan"  # Operator for the metric. Change if needed.
        threshold          = 25  # Threshold for the metric. Change if needed.
      }

      scale_action {
        direction = "Decrease"  # Direction of scaling. Change if needed.
        type      = "ChangeCount"  # Type of scaling action. Change if needed.
        value     = 1  # Value for the scaling action. Change if needed.
        cooldown  = "PT1M"  # Cooldown period. Change if needed.
      }
    }
  }
}