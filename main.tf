resource "azurerm_log_analytics_workspace" "logs" {
  name                = var.LA_Workspace_Name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  retention_in_days   = var.LA_retention_in_days

  tags = var.tags
}

resource "azurerm_security_center_workspace" "logs" {
  count        = length(var.security_center_subscription)
  scope        = "/subscriptions/${element(var.security_center_subscription, count.index)}"
  workspace_id = azurerm_log_analytics_workspace.logs.id
}

resource "azurerm_log_analytics_solution" "logs" {
  for_each = toset(var.solutions)
  solution_name         = each.key
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logs.id
  workspace_name        = azurerm_log_analytics_workspace.logs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/${each.key}"
  }
}