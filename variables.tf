variable "host_ip" {
  description = "The IP address of the remote machine"
  type        = string
}

variable "username" {
  description = "SSH username"
  type        = string
}

variable "password" {
  description = "SSH password"
  type        = string
  sensitive   = true
}
