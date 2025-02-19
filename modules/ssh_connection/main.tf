variable "host_ip" {}
variable "username" {}
variable "password" {}

output "ssh_conn" {
  value = {
    type     = "ssh"
    user     = var.username
    password = var.password
    host     = var.host_ip
  }
}
