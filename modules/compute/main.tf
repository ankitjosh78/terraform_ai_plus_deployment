variable "ssh_conn" {}

resource "null_resource" "compute_setup" {
  connection = var.ssh_conn

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y && sudo apt upgrade -y",
      "sudo apt install -y git python3 python3-pip curl wget"
    ]
  }
}
