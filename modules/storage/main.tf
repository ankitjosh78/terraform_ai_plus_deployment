variable "ssh_conn" {}

resource "null_resource" "storage_setup" {
  connection = var.ssh_conn

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /mnt/storage",
      "sudo mount /dev/sdb1 /mnt/storage || echo 'Storage already mounted'"
    ]
  }
}

