output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "karpenter_node_role_name" {
  value = module.eks.karpenter_node_role_name
}

output "karpenter_controller_role_arn" {
  value = module.eks.karpenter_controller_role_arn
}

output "karpenter_interruption_queue_name" {
  value = module.eks.karpenter_interruption_queue_name
}
