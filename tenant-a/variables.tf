variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "azure-multitenant-tenant-a-rg"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "virtual_wan_name" {
  description = "The name of the Virtual WAN"
  type        = string
  default     = "multitenant-vwan"
}

variable "virtual_hub_name" {
  description = "The name of the Virtual Hub"
  type        = string
  default     = "EastUS-Hub"
}

variable "virtual_hub_address_prefix" {
  description = "The address prefix for the Virtual Hub"
  type        = string
  default     = "10.0.0.0/24"
}

variable "tenanta_subscription_id" {
  description = "ID of the subscription where the resources will be deployed"
  type        = string
}

variable "dns_vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.1.0.0/24"]
}

variable "dns_inbound_resolver_subnet_address_prefix" {
  description = "Address prefix for the DNS Resolver subnet"
  type        = list(string)
  default     = ["10.1.0.0/27"]
}

variable "dns_outbound_resolver_subnet_address_prefix" {
  description = "Address prefix for the DNS Resolver subnet"
  type        = list(string)
  default     = ["10.1.0.32/27"]
}

variable "vma_vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.2.0.0/24"]
}

variable "vma_subnet_address_prefix" {
  description = "Address prefix for the VM in Tenant A subnet"
  type        = list(string)
  default     = ["10.2.0.0/27"]
}

variable "vma_admin_password" {
  description = "Password for VM in Tenant A" # Not recommended to use. Only for testing. Pass value while running in CLI
  type        = string
}

variable "tenanta_id" {
  description = "ID of Tenand A"
  type        = string
}

