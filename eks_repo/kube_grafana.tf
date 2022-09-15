resource "kubernetes_namespace" "grafana" {
  metadata {
    name = "grafana"
  }
}

resource "kubernetes_deployment" "grafana" {
  metadata {
    name      = "grafana"
    namespace = kubernetes_namespace.grafana.metadata.0.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "grafana"
      }
    }
    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }
      spec {
        container {
          image = "grafana/grafana:8.4.4"
          name  = "grafana-container"
          port {
            container_port = 3000
          }


        }
      }
    }
  }
}

resource "kubernetes_service" "grafana" {
  metadata {
    name      = "grafana"
    namespace = kubernetes_namespace.grafana.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.grafana.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      name        = "grafana"
      port        = 3000
      target_port = 3000
    }
  }
}
