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


#variable "environment" {
#  type        = string
#  default     = "dev"
#}
#variable "vpc_cidr" {
#  type        = string
#  description = "The base CIDR block assigned to the main VPC"
#  default     = "10.0.0.0/16"
#}
#
#variable "public_subnet_cidrs" {
#  type        = list(string)
#  description = "List of CIDR blocks for public subnets"
#  default     = ["10.0.1.0/24", "10.0.2.0/24"]
#}
#
#variable "private_subnet_cidrs" {
#  type        = list(string)
#  description = "List of CIDR blocks for private subnets"
#  default     = ["10.0.10.0/24", "10.0.11.0/24"]
#}