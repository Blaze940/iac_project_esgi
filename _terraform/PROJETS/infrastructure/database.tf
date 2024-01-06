resource "mongodbatlas_cluster" "gimmigameCluster" {
  project_id   = "6598a26d44ef2550b91047e0"
  name         = "gimmigameCluster"

  provider_region_name        = "EU-WEST-3"
  provider_instance_size_name = "M0"
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"

}

//Acces depuis l'IP voulue
resource "mongodbatlas_project_ip_access_list" "project_ip_access" {
  project_id = "6598a26d44ef2550b91047e0"
  cidr_block = "81.66.209.254/32"
  comment    = "my ip"
}

//Creation user pour db
resource "mongodbatlas_database_user" "db_user_full" {
  username           = "db_user_full"
  password           = "db_password"
  project_id         = "6598a26d44ef2550b91047e0"
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
}



