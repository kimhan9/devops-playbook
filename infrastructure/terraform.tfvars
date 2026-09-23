vpc_name        = "horus"
vpc_cidr        = "10.0.0.0/16"
aws_region      = "ap-southeast-1"
azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
private_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
public_subnets  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
tags = {
  Project     = "horus"
  Environment = "dev"
}

cluster_name    = "horus"
cluster_version = "1.34"