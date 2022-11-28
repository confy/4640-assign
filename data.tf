data "digitalocean_project" "confy" {
  name = "confy"
}

data "digitalocean_ssh_key" "key" {
  name = "4640"
}
