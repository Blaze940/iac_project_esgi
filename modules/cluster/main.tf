resource "scaleway_vpc_private_network" "myvpc" {
  name       = "subnet_demo"
  tags       = ["demo", "terraform"]
  region     = "fr-par"
  project_id = var.project_id
}

resource "scaleway_k8s_cluster" "cluster" {
  name                        = "mycluster"
  version                     = "1.28.2"
  delete_additional_resources = true
  cni                         = "cilium"
  type                        = "kapsule"
  private_network_id          = scaleway_vpc_private_network.myvpc.id
  project_id                  = var.project_id
}

resource "scaleway_k8s_pool" "bill" {
  cluster_id             = scaleway_k8s_cluster.cluster.id
  name                   = "bill"
  node_type              = "DEV1-M"
  size                   = 1
  min_size               = 0
  max_size               = 1
  autoscaling            = true
  autohealing            = true
  container_runtime      = "containerd"
  root_volume_size_in_gb = 20
}





