variable "public_key" {
  description = "SSH Public Key"
  type        = string
  default     = file("${path.module}/id_rsa.pub")
}
