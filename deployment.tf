resource "kubernetes_deployment" "demo" {
  metadata {
    name = "spring-boot-k8s"
    namespace = "spring-boot"
  }
  spec {
    selector {
      match_labels = {
        "app" = "spring-boot-k8s"
      }
    }
    replicas = 2
    template {
      metadata {
        labels = {
            "app" = "spring-boot-k8s"
        }
      }
      spec {
        container {
          name = "spring-boot-k8s"
          image = "yildirim7mustafa/devops-integration:v2.1"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 8081
          }
        }
      }
    }
  }
}