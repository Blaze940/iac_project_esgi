provider "scaleway" {
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = "cd0e9833-03f8-4028-91a6-5987f59542e9"
  project_id      = "754805a7-340c-4eff-b97f-67b2667bff7b"
  zone            = "fr-par-1"
  region          = "fr-par"
}
resource "scaleway_registry_namespace" "namespace-determined-dubinsky" {
  name        = "namespace-determined-dubinsky"
  description = "Main container registry"
  project_id  = "754805a7-340c-4eff-b97f-67b2667bff7b"
}

resource "scaleway_secret" "secret" {
  depends_on = [scaleway_registry_namespace.namespace-determined-dubinsky]
  name       = "the-secret"
  project_id = "754805a7-340c-4eff-b97f-67b2667bff7b"
}

resource "scaleway_object_bucket" "my-bucket-5" {
  name       = "my-bucket-de-mon-iac-5"
  project_id = "754805a7-340c-4eff-b97f-67b2667bff7b"
}
