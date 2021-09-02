
variable "resource_group_name" {
  description = "K8S azure resource groupe name"
}

variable "resource_location" {
   description = "resource location"
}

variable "cluster_name" {
   description = "Name of kubernetes cluster in AKS"
}

variable "kubernetes_version" {
  description = "Version of kubernetes to use"
}

variable "node_resource_group_name" {
  description = "resource groupe of node"
}

variable "default_node_pool_name" {
  description = "Name of node pool"
}
variable "system_node_count" {
  description = "Number of node on kubernetes cluster"
}

variable "vm_size" {
  description = "Size of virtual machine of nodes"
}

variable "vm_scale_sets" {
  description = "Availability Zones is a high-availability offering that allows to spread the nodes in this node pool across multiple physical locations"
}

variable "enable_auto_scaling" {
  description = "Set if scaling vms is automatic or manual"
}

variable "identity_type" {
  description = "The type of identity used for the managed cluster"
}

variable "load_balancer_sku" {
  description = "An Azure Load Balancer routes and balances traffic to a Kubernetes cluster"
}

variable "network_plugin" {
  description = "Network configuration using kubenet with a default virtual network"
}