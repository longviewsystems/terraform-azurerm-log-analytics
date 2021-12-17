output "LA_resource_id" {
  description = "Resource Id of Log Analytics resource in Azure."
  value       = azurerm_log_analytics_workspace.logs.id
}

output "LA_workspace_id" {
  description = "Log Analytics Workspace id.  This is a guid."
  value       = azurerm_log_analytics_workspace.logs.workspace_id
}

output "LA_name" {
  description = "Log Analytics Workspace id.  This is a guid."
  value       = azurerm_log_analytics_workspace.logs.name
}
