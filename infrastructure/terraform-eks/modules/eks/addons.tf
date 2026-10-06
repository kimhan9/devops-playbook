################################################################################
# AWS Load Balancer Controller
################################################################################
module "alb_controller_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"
  version = "2.9.0"

  name = "${var.cluster_name}-alb-controller"
  use_name_prefix = false
  attach_aws_lb_controller_policy = true
  aws_lb_controller_policy_name = "${var.cluster_name}-alb-controller-policy"
  associations = {
    this = {
      cluster_name = var.cluster_name
      namespace = "kube-system"
      service_account = "aws-load-balancer-controller"
    }
  }

  tags = var.tags
  depends_on = [module.eks]
}

################################################################################
# Karpenter
################################################################################
module "karpenter" {
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "21.26.0"

  cluster_name = var.cluster_name
  iam_role_name = "${var.cluster_name}-karpenter-controller"
  iam_role_use_name_prefix = false
  iam_policy_name = "${var.cluster_name}-karpenter-controller-policy"
  iam_policy_use_name_prefix = false

  create_node_iam_role = false
  node_iam_role_arn = module.eks.eks_managed_node_groups["core"].iam_role_arn

  # Since the node group role will already have an access entry
  create_access_entry = false

  queue_name = "${var.cluster_name}-karpenter"
  tags = var.tags
  depends_on = [module.eks]
}