# Lets have fun on Linux!

# variable blocks
variable "filename" {
  default     = "pets.txt"
  type        = string
  description = "the path of local file"
  #sensitive   = true
}
variable "content" {
  default     = "I love pets!"
  type        = string
  description = "the content of the file"
}
variable "prefix" {
  default     = "Mrs"
  type        = string
  description = "the prefix to be set"
}
variable "separator" {
  default = "."
}
variable "length" {
  default = 2
  type    = number
}