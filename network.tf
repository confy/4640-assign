resource "digitalocean_vpc" "assign" {
  name   = "assign"
  region = var.region
}
