/* Kubernetes Cluster Creation */
resource "azurerm_kubernetes_cluster" "k8s" {

  /* Basic Clustr Information */
  name                    = var.cluster_name
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  dns_prefix              = var.dns_prefix
  private_cluster_enabled = true

  /* Virtual Machine Information*/
  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_D2_v2"
    os_disk_size_gb     = 30
    enable_auto_scaling = true
    vnet_subnet_id      = azurerm_subnet.subnet.id
  }

  /* Linux Profile */
  linux_profile {
    admin_username = "admin"
    ssh_key {
      key_data = "Pending"
    }
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
  role_based_access_control {
    enabled = true
  }

  tags = {
    Organization = "AtomStateTechnologiesPvtLtd"
    by           = "Sainath Sapa"
  }
  aci_connector_linux {
    subnet_name = azurerm_subnet.subnet.name
  }

  /* Role Assignemt */
  depends_on = [
    azurerm_role_assignment.role_assign,
  ]

}
