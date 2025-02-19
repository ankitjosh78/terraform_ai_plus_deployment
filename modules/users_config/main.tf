variable "ssh_conn" {}

resource "null_resource" "user_config" {
  connection = var.ssh_conn

  provisioner "remote-exec" {
    inline = [
      "sudo useradd -m -s /bin/bash deployer || echo 'User already exists'",
      "echo 'deployer ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/deployer",
      "sudo groupadd -f docker",
      "sudo usermod -aG docker deployer"
    ]
  }
}
