variable "ssh_conn" {}

resource "null_resource" "docker_setup" {
  connection = var.ssh_conn

  provisioner "remote-exec" {
    inline = [
      "sudo apt install -y docker.io",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo usermod -aG docker ${var.ssh_conn.user}"
    ]
  }
}
