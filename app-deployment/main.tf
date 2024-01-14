# # main.tf

provider "scaleway" {
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = var.organization_id
  project_id      = var.project_id
  zone            = "fr-par-1"
  region          = "fr-par"
}

provider "kubernetes" {
  host                   = module.cluster.cluster_output.kubeconfig[0].host
  token                  = module.cluster.cluster_output.kubeconfig[0].token
  cluster_ca_certificate = base64decode(module.cluster.cluster_output.kubeconfig[0].cluster_ca_certificate)
}



module "cluster" {
  source = "../modules/cluster"
}

module "db" {
  source = "../modules/db"
}

terraform {
  backend "s3" {
    bucket                      = "my-bucket-de-mon-iac-5"
    key                         = "terraform.tfstate"
    region                      = "fr-par"
    endpoints                   = { s3 = "https://s3.fr-par.scw.cloud" }
    skip_credentials_validation = true
    skip_region_validation      = true
    access_key                  = "SCWEWNMQVPS06AVQS6HB"
    secret_key                  = "e3b96102-ff0f-4442-b789-4981f0efaebe"
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}


module "kubernetes" {
  depends_on = [module.cluster]
  source     = "../modules/kubernetes"

  ip   = module.db.db_ip
  port = module.db.db_port
}



# resource "scaleway_object_bucket" "my-bucket" {
#   depends_on = [module.cluster, module.db, module.kubernetes]
#   name       = "my-bucket-de-mon-iac"
#   project_id = var.project_id

# }



# # resource "kubernetes_service" "nginx" {

# #   metadata {
# #     name = "ingress-nginx-controller"
# #     # namespace = helm_release.nginx_ingress.namespace
# #     annotations = {
# #       "service.beta.kubernetes.io/scw-loadbalancer-zone" : "fr-par-1"
# #     }
# #   }

# #   spec {

# #     port {
# #       port        = 80
# #       protocol    = "TCP"
# #       target_port = 5000
# #     }

# #     type = "LoadBalancer"
# #   }

# #   lifecycle {
# #     ignore_changes = [
# #       metadata[0].annotations["service.beta.kubernetes.io/scw-loadbalancer-id"],
# #       metadata[0].labels["k8s.scaleway.com/cluster"],
# #       metadata[0].labels["k8s.scaleway.com/kapsule"],
# #       metadata[0].labels["k8s.scaleway.com/managed-by-scaleway-cloud-controller-manager"],
# #     ]
# #   }
# # }

# # resource "kubernetes_ingress_class_v1" "ingress-class" {
# #   metadata {
# #     name = "ingress-class"
# #     labels = {
# #       "app.kubernetes.io/component" = "controller"
# #     }
# #     annotations = {
# #       "ingressclass.kubernetes.io/is-default-class" = "true"
# #     }
# #   }


# #   spec {
# #     controller = "k8s.io/ingress-nginx"
# #     parameters {
# #       api_group = "k8s.example.com"
# #       kind      = "IngressParameters"
# #       name      = "external-lb"
# #     }
# #   }
# # }



# output "kubeconfig" {
#   value     = module.cluster.cluster_output.kubeconfig[0].config_file
#   sensitive = true
# }
