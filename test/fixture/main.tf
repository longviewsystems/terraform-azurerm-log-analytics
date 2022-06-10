module "LA" {
  source                       = "../../" #testing root module.
  resource_group_name          = azurerm_resource_group.fixture.name
  tags                         = var.tags
  location                     = var.location
  la_workspace_name            = module.naming.log_analytics_workspace.name_unique
  solutions                    = var.solutions
  security_center_subscription = var.security_center_subscription
  automation_account_name      = module.naming.automation_account.name_unique
  activity_log_subscriptions   = var.activity_log_subscriptions
}