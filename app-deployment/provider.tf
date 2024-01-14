terraform {
  required_providers {

    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.35.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
  required_version = ">= 0.13"

}
