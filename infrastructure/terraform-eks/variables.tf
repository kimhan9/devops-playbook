# VPC

variable "aws_region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

# EKS

variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "cluster_endpoint_whitelist" {
  description = "EKS api server whitelist"
  type = list(string)
}

variable "access_entries" {
  type = map(object({
    principal_arn = string
    type          = optional(string, "STANDARD")
    policy_associations = optional(map(object({
      policy_arn = string
      access_scope = object({
        type = string
      })
    })), {})
  }))
  default = {}
}

variable "ec2_instance_types" {
  type = list(string)
}

variable "ec2_min_size" {
  type = number
}

variable "ec2_max_size" {
  type = number
}

variable "ec2_desired_size" {
  type = number
}