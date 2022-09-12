/* Connection with Kube */
data "azurerm_kubernetes_cluster" "forconnection" {
  name                = "AtomKubeCluster"
  resource_group_name = var.resource_group_name
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.forconnection.kube_config.0.host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.forconnection.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.forconnection.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.forconnection.kube_config.0.cluster_ca_certificate)
}

/* Deploy the Fluentd */
resource "kubernetes_deployment" "fluentd" {
  metadata {
    name = "kubenet_deployment_fluentd"

  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "Fluentd"
      }
    }

    template {
      metadata {
        labels = {
          test = "Fluentd"
        }
      }

      spec {
        container {
          image = "fluent/fluentd"
          name  = "fluentd"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }



          initial_delay_seconds = 3
          period_seconds        = 3
        }
      }
    }
  }
}

