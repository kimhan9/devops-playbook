vpc_name        = "horus"
vpc_cidr        = "10.241.0.0/16"
aws_region      = "ap-southeast-1"
azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
private_subnets = ["10.241.128.0/20", "10.241.144.0/20", "10.241.160.0/20"]
public_subnets  = ["10.241.40.0/22", "10.241.44.0/22", "10.241.48.0/22"]

cluster_name = "horus"
cluster_version = "1.36"
cluster_endpoint_whitelist = ["0.0.0.0/0"]
access_entries = {
  kimi = {
    principal_arn = "arn:aws:iam::238344778006:user/kimi"

    policy_associations = {
      access = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

        access_scope = {
          type = "cluster"
        }
      }
    }
  }
}
ec2_instance_types = ["m5.large"]
ec2_min_size = 1
ec2_max_size = 3
ec2_desired_size = 1

tags = {
  Project     = "horus"
  Environment = "dev"
  Terraform   = "true"
}