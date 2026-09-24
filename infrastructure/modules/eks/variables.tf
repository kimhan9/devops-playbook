variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "cluster_cidr" {
  description = "EKS cluster ipv4 cidr"
  type        = string
  default     = "172.20.0.0/16"
}

variable "cluster_endpoint_whitelist" {
  description = "EKS api server access"
  type        = list(string)
}

variable "access_entries" {
  description = "EKS access entries"
  type = map(object({
    principal_arn = string
    type = optional(string, "STANDARD")
    policy_associations = optional(map(object({
      policy_arn = string
      access_scope = object({
        type = string
      })
    })), {})
  }))
  default = {}
}

variable "ami_type" {
  type    = string
  default = "BOTTLEROCKET_x86_64"
}

variable "ami_release_version" {
  type    = string
  default = ""
}

variable "ec2_capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "ec2_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "ec2_min_size" {
  type = number
  default = 1
}

variable "ec2_max_size" {
  type = number
  default = 3
}

variable "ec2_desired_size" {
   type = number
   default = 1
}

variable "enable_critical_addons_taint" {
  description = "Taint node group"
  type        = bool
  default     = false
}

variable "tags" {
  type = map(string)
}
