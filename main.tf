module "networking" {
  source = "./modules/networking/"
  
  vpc_cidr           = var.vpc_cidr
  environment        = var.environment
  availability_zones = var.availability_zones
}

module "compute" {
  source = "./modules/compute"
  
  environment      = var.environment
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  subnet_ids       = module.networking.public_subnet_ids
  security_group_id = module.networking.web_security_group_id
}
