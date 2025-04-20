variable "tenantb_subscription_id" {
  description = "ID of the subscription where the resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "azure-multitenant-tenant-b-rg"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "vmb_vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.100.0.0/24"]
}

variable "vmb_subnet_address_prefix" {
  description = "Address prefix for the VM in Tenant A subnet"
  type        = list(string)
  default     = ["10.100.0.0/27"]
}

variable "vmb_admin_password" {
  description = "Password for VM in Tenant A" # Not recommended to use. Only for testing. Pass value while running in CLI
  type        = string
}

variable "dns_vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.101.0.0/24"]
}

variable "dns_inbound_resolver_subnet_address_prefix" {
  description = "Address prefix for the DNS Resolver subnet"
  type        = list(string)
  default     = ["10.101.0.0/27"]
}

variable "dns_outbound_resolver_subnet_address_prefix" {
  description = "Address prefix for the DNS Resolver subnet"
  type        = list(string)
  default     = ["10.101.0.32/27"]
}

variable "tenantb_id" {
  description = "ID of Tenand B"
  type        = string
}