module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = "${var.vpc_name}-vpc"
  cidr = var.vpc_cidr

  azs  = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  map_public_ip_on_launch = true
  enable_nat_gateway = true
  single_nat_gateway = true
    
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "karpenter.sh/discovery" = var.cluster_name
  }

  tags = var.tags
}

module "vpc_endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "~> 6.0"

  vpc_id = module.vpc.vpc_id

  endpoints = {
    s3 = {
      service         = "s3"
      service_type    = "Gateway"
      route_table_ids = module.vpc.private_route_table_ids
      tags = { Name = "${var.vpc_name}-vpce-s3" }
    }
  }

  tags = var.tags
}

#resource "aws_security_group" "app_sg" {
#  name   = "${var.vpc_name}-app"
#  vpc_id = module.vpc.vpc_id
#}

#resource "aws_security_group" "rds_sg" {
#  name   = "${var.vpc_name}-rds"
#  vpc_id = module.vpc.vpc_id
#}

#resource "aws_security_group_rule" "rds_from_app" {
#  type                     = "ingress"
#  security_group_id        = aws_security_group.rds_sg.id
#  from_port                = 5432
#  to_port                  = 5432
#  protocol                 = "tcp"
#  source_security_group_id = aws_security_group.app_sg.id
#  description              = "Postgres from app"
#}