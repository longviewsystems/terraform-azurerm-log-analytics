variable "location" {
  type        = string
  description = "Azure location where resources should be deployed."
  default     = "westus"
}

variable "sku" {
  type        = string
  description = "Specified the Sku of the Log Analytics Workspace."
  default     = "PerGB2018"
}

variable "la_retention_in_days" {
  type        = number
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

  default = []
}

variable "activity_log_subscriptions" {
  description = "List of subscriptions this log analytics should collect Activity Logs (Diagnostic Logs) for."
  type        = map(string)
  default = {
    SUB-LVS-CMP-DEV  = "7f3c4fcf-626c-49e0-9160-a756147abaa4"
    SUB-LVS-CMP-DEV2 = "fdd234dc-7c17-4710-958a-2fc1fb7ba842"
    SUB-LVS-CMP-DEV3 = "caf1f457-d51b-4e2d-b243-4cef0766f9d1"
  }
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default = {
    owner = "terratest"
  }
}
