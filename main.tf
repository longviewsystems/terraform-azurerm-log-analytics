resource "azurerm_log_analytics_workspace" "logs" {
  name                = var.la_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  retention_in_days   = var.la_retention_in_days

  tags = var.tags
}

resource "azurerm_security_center_workspace" "logs" {
  count        = length(var.security_center_subscription)
  scope        = "/subscriptions/${element(var.security_center_subscription, count.index)}"
  workspace_id = azurerm_log_analytics_workspace.logs.id
}

resource "azurerm_log_analytics_solution" "logs" {
  for_each              = toset(var.solutions)
  solution_name         = each.key
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logs.id
  workspace_name        = azurerm_log_analytics_workspace.logs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/${each.key}"
  }

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "sub_diags" {
  for_each                   = var.activity_log_subscriptions
  name                       = each.key
  target_resource_id         = "/subscriptions/${each.value}" //subscriptions/fdd234dc-7c17-4710-958a-2fc1fb7ba842"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id

  log {
    category = "Administrative"
    enabled  = true
  }

  log {
    category = "Recommendation"
    enabled = true
  }

  log {
    category = "Alert"
    enabled = true
  }

  log {
    category = "Autoscale"
    enabled = true
  }

  log {
    category = "Policy"
    enabled = true
  }

  log {
    category = "Security"
    enabled = true
  }

  log {
    category = "ServiceHealth"
    enabled = true
  }

  log {
    category = "ResourceHealth"
    enabled = true
  }
}