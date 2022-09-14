/* Connection with Kube */
data "azurerm_kubernetes_cluster" "forconnection" {
  name                = var.cluster_name
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
        app = "Fluentd"
      }
    }

    template {
      metadata {
        labels = {
          app = "Fluentd"
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

resource "kubernetes_service" "fluentd" {
  metadata {
    name = "kubenet_service_fluentd"
  }
  spec {
    selector = {
      app = kubernetes_deployment.fluentd.spec.0.template.0.metadata.0.labels.app
    }

    port {

      port        = 80
      target_port = 80
    }
  }
}

