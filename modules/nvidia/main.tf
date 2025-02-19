variable "ssh_conn" {}

resource "null_resource" "nvidia_setup" {
  connection = var.ssh_conn

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -",
      "distribution=$(. /etc/os-release;echo $ID$VERSION_ID)",
      "curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list",
      "sudo apt update -y",
      "sudo apt install -y nvidia-driver-550 cuda-toolkit-12-4 nvidia-container-toolkit"
    ]
  }
}
