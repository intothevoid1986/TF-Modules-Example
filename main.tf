module "networking" {
  source = "./modules/networking/"
  
  vpc_cidr           = var.vpc_cidr
  environment        = var.environment
  availability_zones = var.availability_zones
}

module "load_balancing" {
  source = "./modules/load-balancing"
  
  environment       = var.environment
  vpc_id            = module.networking.vpc_id
  subnet_ids        = module.networking.public_subnet_ids
  security_group_id = module.networking.web_security_group_id
}

module "compute" {
  source = "./modules/compute"
  
  environment      = var.environment
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  subnet_ids       = module.networking.public_subnet_ids
  security_group_id = module.networking.web_security_group_id
  target_group_arn = module.load_balancing.target_group_arn
  
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
}
