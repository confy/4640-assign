variable "token" {
  type = string
}

variable "region" {
  type = string
}

variable "num_db_nodes" {
  type    = number
  default = 1
}

variable "num_app_nodes" {
  type    = number
  default = 3
}

variable "my_ip" {
  type = string
}