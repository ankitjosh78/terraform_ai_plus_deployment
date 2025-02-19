terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
    }
  }
}

provider "null" {}

variable "host_ip" {}
variable "username" {}
variable "password" {}

module "ssh_connection" {
  source   = "./modules/ssh_connection"
  host_ip  = var.host_ip
  username = var.username
  password = var.password
}

module "compute" {
  source   = "./modules/compute"
  ssh_conn = module.ssh_connection.ssh_conn
}

module "storage" {
  source   = "./modules/storage"
  ssh_conn = module.ssh_connection.ssh_conn
}

module "docker" {
  source   = "./modules/docker"
  ssh_conn = module.ssh_connection.ssh_conn
}

module "nvidia" {
  source   = "./modules/nvidia"
  ssh_conn = module.ssh_connection.ssh_conn
}

module "users_config" {
  source   = "./modules/users_config"
  ssh_conn = module.ssh_connection.ssh_conn
}
