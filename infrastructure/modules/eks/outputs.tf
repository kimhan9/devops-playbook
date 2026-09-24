output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "node_group_name" {
  value = try(split(":", module.eks.eks_managed_node_groups["core"].node_group_id)[1], null)
}

output "node_group_arn" {
  value = module.eks.eks_managed_node_groups["core"].node_group_arn
}

output "node_group_status" {
  value = module.eks.eks_managed_node_groups["core"].node_group_status
}
