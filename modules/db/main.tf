resource "scaleway_rdb_instance" "dbinstance" {
  name           = "test-rdb"
  node_type      = "db-dev-s"
  disable_backup = true
  engine         = "MySQL-8"
  user_name      = "admin"
  password       = "thiZ_is_v&ry_s3cret"
  init_settings = {
    "lower_case_table_names" = 1
  }
  settings = {
    "max_connections" = "350"
  }
  project_id = "754805a7-340c-4eff-b97f-67b2667bff7b"
}


# resource "scaleway_rdb_user" "mydb" {
#   instance_id = scaleway_rdb_instance.scaleway-rdb.id
#   name        = "admin"
#   password    = var.rdb_user_scaleway_db_password
#   is_admin    = false
# }

# resource "scaleway_rdb_acl" "mydb" {
#   instance_id = scaleway_rdb_instance.dbinstance.id
#   acl_rules {
#     ip          = var.instance_ip_addr
#     description = "SCW instance"
#   }
