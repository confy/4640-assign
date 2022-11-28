resource "digitalocean_database_cluster" "mongo" {
  name                 = "mongo"
  engine               = "mongodb"
  version              = "4"
  size                 = "db-s-1vcpu-1gb"
  region               = var.region
  node_count           = var.num_db_nodes
  private_network_uuid = digitalocean_vpc.assign.id
  tags                 = [digitalocean_tag.assign.name]

}

resource "digitalocean_database_firewall" "mongo" {
  cluster_id = digitalocean_database_cluster.mongo.id
  rule {
    type  = "tag"
    value = digitalocean_tag.assign.name
  }
  rule {
    type  = "ip_addr"
    value = var.my_ip
  }
}
