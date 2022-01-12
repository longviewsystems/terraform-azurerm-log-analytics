variable "LA_Workspace_Name" {
  type        = string
  description = "Name of Log Analystics Workspace."
}

variable "Automation_Account_Name" {
  type        = string
  description = "Name of Automation Account."
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group to deploy resources in."
}

variable "location" {
  type        = string
  description = "Azure location where resources should be deployed."
}

variable "sku" {
  type        = string
  description = "Specified the Sku of the Log Analytics Workspace."
  default     = "PerGB2018"
}

variable "LA_retention_in_days" {
  description = "The workspace data retetion in days. Possible values range between 30 and 730."
  default     = 30
}

variable "security_center_subscription" {
  description = "List of subscriptions this log analytics should collect data for. Does not work on free subscription."
  type        = list(string)
  default     = []
}

variable "solutions" {
  type        = list(any)
  description = "A list of solution names to add to the workspace."

  default = [
    "AgentHealthAssessment",
    "AntiMalware",
    "AzureActivity",
    "ChangeTracking",
    "Security",
    "SecurityInsights",
    "ServiceMap",
    "SQLAssessment",
    "Updates",
    "VMInsights"
  ]
}

# variable "ad_groups_to_create" {
#   type = map(object({
#     ad_group_name        = string,
#     ad_group_description = string,
#     owners               = list(string)
#   }))
#   description = "The list of Management Groups at the second level of the hierarchy, and the subscriptions associated with each one.  The parent should be an Management Group from Level 1."
#   default = {
#     "LandingZoneOwners" = {
#       ad_group_name        = "AzRBAC - Landing Zone Management Group Owners",
#       ad_group_description = "Members will be owners of the 'Landing Zones' Management Group",
#       owners               = null
#     },
#     "DecommOwners" = {
#       ad_group_name        = "AzRBAC - Decomissioned Management Group Owners",
#       ad_group_description = "Members will be owners of the 'Decomissioned' Management Group",
#       owners               = null
#     }
#   }
# }

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
