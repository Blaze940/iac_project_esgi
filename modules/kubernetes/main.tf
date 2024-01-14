resource "kubernetes_deployment_v1" "node-app" {
  metadata {
    name = "node-app-deployment"
    labels = {
      app = "node-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "node-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "node-app"
        }
      }

      spec {
        container {
          env {
            name  = "ip"
            value = var.ip
          }
          env {
            name  = "port"
            value = var.port
          }
          image = "rg.fr-par.scw.cloud/namespace-determined-dubinsky/myapp:latest"
          name  = "node-app"
          port {
            container_port = 3000
            host_port      = 5000
            protocol       = "TCP"
          }

        }
        restart_policy = "Always"
      }
    }
  }
}


resource "kubernetes_service_v1" "node-app-svc" {
  metadata {
    name = "node-app-svc"
    labels = {
      app = "node-app"
    }
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "node-app"
    }
    port {
      port        = 5000
      target_port = 3000
      protocol    = "TCP"
    }
  }
}


# resource "kubernetes_ingress_v1" "example_ingress" {
#   metadata {
#     name = "example-ingress"
#     annotations = {
#       "nginx.ingress.kubernetes.io/rewrite-target" = "/"
#       "kubernetes.io/ingress-class"                = "nginx"
#     }
#   }

#   spec {
#     rule {
#       http {
#         path {
#           backend {
#             service {
#               name = "node-app-svc"
#               port {
#                 number = 5000
#               }
#             }
#           }

#           path      = "/"
#           path_type = "ImplementationSpecific"
#         }
#       }
#     }
#   }
# }
