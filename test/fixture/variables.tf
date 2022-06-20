variable "resource_group_name" {
  type        = string
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
  default     = ""
}

variable "public_ip_allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  default     = "Static"
}

variable "public_ip_sku" {
  type        = string
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  default     = "Standard"
}

variable "domain_name_label" {
  type        = string
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system"
  default     = null
}

variable "azure_bastion_service_name" {
  type        = string
  description = "Specifies the name of the Bastion Host"
  default     = ""
}

variable "azure_bastion_subnet_address_prefix" {
  type        = list(any)
  description = "The address prefix to use for the Azure Bastion subnet"
  default     = []
}

variable "enable_copy_paste" {
  type        = bool
  description = "Is Copy/Paste feature enabled for the Bastion Host?"
  default     = true
}

variable "enable_file_copy" {
  type        = bool
  description = "Is File Copy feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`"
  default     = false
}

variable "bastion_host_sku" {
  type        = string
  description = "The SKU of the Bastion Host. Accepted values are `Basic` and `Standard`"
  default     = "Basic"
}

variable "enable_ip_connect" {
  type        = bool
  description = "Is IP Connect feature enabled for the Bastion Host?"
  default     = false
}

variable "scale_units" {
  type        = number
  description = "The number of scale units with which to provision the Bastion Host. Possible values are between `2` and `50`. `scale_units` only can be changed when `sku` is `Standard`. `scale_units` is always `2` when `sku` is `Basic`."
  default     = 2
}

variable "enable_shareable_link" {
  type        = bool
  description = "Is Shareable Link feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`"
  default     = false
}

variable "enable_tunneling" {
  type        = bool
  description = "Is Tunneling feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "azure_bastion_subnet_name" {
  type        = string
  description = "The name of the azure bastion subnet"
  default     = ""
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
  default     = "EastUS"
}

variable "vnet_address_space" {
  description = "The address space to be used for the Azure virtual network."
  type        = list(any)
  default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
  description = "List of DNS servers to use for virtual network"
  type        = list(any)
  default     = []
}