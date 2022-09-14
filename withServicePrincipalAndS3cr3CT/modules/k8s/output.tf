output "k8s" {
  value = azurerm_kubernetes_cluster.k8s
}

data "azurerm_public_ip" "k8s" {
  name                = reverse(split("/", tolist(azurerm_kubernetes_cluster.k8s.network_profile.0.load_balancer_profile.0.effective_outbound_ips)[0]))[0]
  resource_group_name = var.rg_name
}

output "cluster_ip" {
  value = data.azurerm_public_ip.k8s.ip_address
}
