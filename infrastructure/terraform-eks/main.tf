module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.private_subnet_ids
  cluster_endpoint_whitelist = var.cluster_endpoint_whitelist
  access_entries = var.access_entries
  ec2_instance_types = var.ec2_instance_types
  ec2_min_size = var.ec2_min_size
  ec2_max_size = var.ec2_max_size
  ec2_desired_size = var.ec2_desired_size
  tags = var.tags
}

module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  cluster_name    = var.cluster_name
  tags            = var.tags
}
