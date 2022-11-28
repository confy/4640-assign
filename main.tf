terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.token
}

# Create a new tag
resource "digitalocean_tag" "assign" {
  name = "assign"
}

resource "digitalocean_project_resources" "assign" {
  project = data.digitalocean_project.confy.id
  resources = flatten([
    digitalocean_droplet.app.*.urn,
    digitalocean_droplet.bastion.*.urn,
    digitalocean_loadbalancer.public.*.urn,
    digitalocean_database_cluster.mongo.*.urn,
  ])
}
