resource "azurerm_resource_group" "kubernetesRg" {
    name     = var.resource_group_name
    location = var.resource_location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.resource_location
  resource_group_name = azurerm_resource_group.kubernetesRg.name
  dns_prefix          = var.cluster_name
  node_resource_group = var.node_resource_group_name

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.system_node_count
    vm_size             = var.vm_size
    type                = var.vm_scale_sets
    availability_zones  = [1]
    enable_auto_scaling = var.enable_auto_scaling
  }

  identity {
    type = var.identity_type
  }

  network_profile {
    load_balancer_sku = var.load_balancer_sku
    network_plugin    = var.network_plugin
  }
}