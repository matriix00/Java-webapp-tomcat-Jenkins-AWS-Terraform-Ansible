module "network" {
  
  source = "./network"
  region = var.region
  subnet_cidrs = var.subnet_cidrs
  vpc_cidrs = var.vpc_cidrs
  az = var.az


}