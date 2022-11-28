output "bastion_ip" {
  value = digitalocean_droplet.bastion.ipv4_address
}

output "app_private_ips" {
  value = digitalocean_droplet.app.*.ipv4_address_private
}

output "lb_ip" {
  value = [digitalocean_loadbalancer.public.ip]
}

output "db_conn_string" {
  sensitive = true
  value = digitalocean_database_cluster.mongo.uri
}
