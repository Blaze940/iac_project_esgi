output "db_ip" {
  value = scaleway_rdb_instance.dbinstance.endpoint_ip
}

output "db_port" {
  value = scaleway_rdb_instance.dbinstance.endpoint_port
}
