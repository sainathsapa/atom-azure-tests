/* Kubernetes Cluster Creation */
resource "azurerm_kubernetes_cluster" "k8s" {


  /* Basic Clustr Information */
  name                    = var.cluster_name
  location                = var.rg_location
  resource_group_name     = var.rg_name
  dns_prefix              = var.dns_prefix
  private_cluster_enabled = true
  /* IP Enabling*/
  private_cluster_public_fqdn_enabled = true

  /* ALso K8S gives attr as  */

  /* Virtual Machine Information*/
  default_node_pool {

    name       = var.vm_name
    node_count = var.cluster_node_count
    max_count  = var.cluster_node_max_count
    min_count  = var.cluster_node_min_count

    vm_size             = var.vm_size_proccer_ram
    os_disk_size_gb     = var.vm_os_disk_size_gb
    enable_auto_scaling = true
    vnet_subnet_id      = var.subnet_id
    type                = "VirtualMachineScaleSet"
  }

  /* Linux Profile */

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = var.ssh_key
    }
  }
  nat_gateway_profile {
    effective_outbound_ips = true
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
    /* azure_active_directory {
      client_app_id
    } */
  }

  tags = {
    Organization = "AtomStateTechnologiesPvtLtd"
    by           = "Sainath Sapa"
  }
  aci_connector_linux {
    subnet_name = var.subnet_name
  }

  /* Role Assignemt */
#   depends_on = [
#     azurerm_role_assignment.role_assign,
#   ]

}
