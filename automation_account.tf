resource "azurerm_automation_account" "logs" {
  name                = var.automation_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_name = "Basic"

  tags = var.tags
}


resource "azurerm_log_analytics_linked_service" "logs" {
  resource_group_name = var.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.logs.id
  read_access_id      = azurerm_automation_account.logs.id
}