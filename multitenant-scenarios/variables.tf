variable "tenanta_resource_group_name" {
  description = "The name of the resource group in Tenant A"
  type        = string
  default     = "azure-multitenant-tenant-a-rg"
}

variable "tenantb_resource_group_name" {
  description = "The name of the resource group in Tenant B"
  type        = string
  default     = "azure-multitenant-tenant-b-rg"
}

variable "tenanta_subscription_id" {
  description = "ID of the subscription where the resources will be deployed"
  type        = string
}

variable "tenantb_subscription_id" {
  description = "ID of the subscription residing in Tenand B where the resources will be deployed"
  type        = string
}

variable "tenantb_id" {
  description = "ID of Tenand B"
  type        = string
}

variable "tenanta_id" {
  description = "ID of Tenand A"
  type        = string
}

variable "tenantb_vnets" {
  description = "List of VNETs in Tenant B"
  type        = list(string)
  default     = ["vm-spoke-tenant-b-vnet", "dns-spoke-tenant-b-vnet"]
}

