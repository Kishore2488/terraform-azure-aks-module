variable "resource_group_name" {
  description = "Name of the resource group to create."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "centralindia"
}

variable "cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool."
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM SKU for the default node pool."
  type        = string
  default     = "Standard_D2s_v5"
}
