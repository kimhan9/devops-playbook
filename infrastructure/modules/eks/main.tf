data "aws_caller_identity" "current" {}

################################################################################
# EKS cluster
################################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name = var.cluster_name
  kubernetes_version = var.cluster_version

  vpc_id = var.vpc_id
  subnet_ids = var.subnets

  endpoint_private_access = false
  endpoint_public_access = true
  endpoint_public_access_cidrs = var.cluster_endpoint_whitelist

  enabled_log_types = []
  create_cloudwatch_log_group = false
  access_entries = var.access_entries

  iam_role_name = "${var.cluster_name}-eks-cluster-role"
  iam_role_use_name_prefix = false

  node_security_group_tags = {
    "karpenter.sh/discovery" = var.cluster_name
  }

  upgrade_policy = {
    support_type = "STANDARD"
  }

  # EKS addons
  addons = {
    coredns = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
      pod_identity_association = [{
        role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/AmazonEKSPodIdentityAmazonVPCCNIRole"
        service_account = "aws-node"
      }]
      configuration_values = jsonencode({
        env = {
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
    aws-ebs-csi-driver = {
      pod_identity_association = [{
        role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/AmazonEKSPodIdentityAmazonEBSCSIDriverRole"
        service_account = "ebs-csi-controller-sa"
      }]
    }
  }

  eks_managed_node_groups = {
    core = {
      name                = "${var.cluster_name}-eks-node"
      ami_type            = var.ami_type
      ami_release_version = var.ami_release_version
      capacity_type       = var.ec2_capacity_type
      instance_types      = var.ec2_instance_types
      min_size            = var.ec2_min_size
      max_size            = var.ec2_max_size
      desired_size        = var.ec2_desired_size

      iam_role_name = "${var.cluster_name}-eks-node-role"
      iam_role_use_name_prefix = false

      labels = {
        "karpenter.sh/controller" = "true"
        "workload-type" = "system"
      }

      taints = var.enable_critical_addons_taint ? {
        addons = {
          key    = "CriticalAddonsOnly"
          value  = "true"
          effect = "NO_SCHEDULE"
        }
      } : {}

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvdb"
          ebs = {
            volume_size           = 50
            volume_type           = "gp3"
            delete_on_termination = true
          }
        }
      }
    }
  }

  tags = var.tags

}
