module "pets_module" {
  source    = "./modules/pets"
  filename  = var.filename
  content   = var.content
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
