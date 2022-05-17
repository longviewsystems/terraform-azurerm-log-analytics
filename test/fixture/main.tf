provider "azurerm" {
  features {}
}

resource "random_id" "rg_name" {
  byte_length = 8
}

resource "azurerm_resource_group" "test" {
  name     = "testRG-${random_id.rg_name.hex}"
  location = var.location
}

module "LA" {
  source                       = "../../" #testing root module.
  resource_group_name          = azurerm_resource_group.test.name
  tags                         = var.tags
  location                     = var.location
  la_workspace_name            = var.la_workspace_name
  solutions                    = var.solutions
  security_center_subscription = var.security_center_subscription
  automation_account_name      = var.automation_account_name
}