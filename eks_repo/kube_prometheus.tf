resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = "prometheus"
  }
}

resource "kubernetes_deployment" "prometheus" {
  metadata {
    name      = "prometheus"
    namespace = kubernetes_namespace.prometheus.metadata.0.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "prometheus"
      }
    }
    template {
      metadata {
        labels = {
          app = "prometheus"
        }
      }
      spec {
        container {
          image = "prom/prometheus"
          name  = "prometheus-container"
          port {
            container_port = 3000
          }


        }
      }
    }
  }
}

resource "kubernetes_service" "prometheus" {
  metadata {
    name      = "prometheus"
    namespace = kubernetes_namespace.prometheus.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.prometheus.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      name        = "prometheus"
      port        = 9090
      target_port = 9090
    }
  }
}
