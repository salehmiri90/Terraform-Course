variable "filename" {
  default     = "pets.txt"
  type        = string
  description = "The path of local file"
  sensitive   = true
}

variable "content" {
  default     = "I love pets!"
  type        = string
  description = "The content of the file"
}

variable "prefix" {
  default     = "Mrs"
  type        = string
  description = "The prefix to be set"
}

variable "separator" {
  default = "."
}

variable "length" {
  default = 2
  type    = number
}
