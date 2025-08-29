# Lets have fun on Linux!

# variable blocks
variable "filename" {
  type        = string
  description = "the path of local file"
}
variable "content" {
  type        = string
  description = "the content of the file"
}
variable "prefix" {
  type        = string
  description = "the prefix to be set"
}
variable "separator" {
  type = string
}
variable "length" {
  type    = number
}