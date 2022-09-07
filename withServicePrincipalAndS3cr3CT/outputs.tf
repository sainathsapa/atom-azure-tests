/* Kubernetes Cluster Name */
output "k8s_cluster_name" {
  value = azurerm_kubernetes_cluster.default.name
}

/* Resource Group Name */
output "used_resource_group_name" {
  value = azurerm_resource_group.default.name
}
