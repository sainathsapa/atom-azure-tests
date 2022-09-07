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

