variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-southeast-1"
}

variable "project" {
  description = "Project name, used for naming and tagging"
  type        = string
}

variable "environment" {
  description = "Environment name, used for tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs of the public (web tier) subnets, one per AZ"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_subnet_cidrs" {
  description = "CIDRs of the private app tier subnets, one per AZ"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_subnet_cidrs" {
  description = "CIDRs of the private database tier subnets, one per AZ"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type for web and app tiers"
  type        = string
  default     = "t3.micro"
}

variable "web_asg_size" {
  description = "Web tier ASG min/desired/max"
  type = object({
    min     = number
    desired = number
    max     = number
  })
  default = { min = 1, desired = 2, max = 4 }
}

variable "app_asg_size" {
  description = "App tier ASG min/desired/max"
  type = object({
    min     = number
    desired = number
    max     = number
  })
  default = { min = 1, desired = 2, max = 4 }
}

variable "certificate_arn" {
  description = "ACM certificate ARN. When set, HTTP redirects to HTTPS; when null, the ALB serves plain HTTP."
  type        = string
  default     = null
}

variable "app_port" {
  description = "Port the app tier listens on"
  type        = number
  default     = 8080
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "db_allocated_storage" {
  description = "RDS storage in GiB"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "sqldb"
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "dbadmin"
}

variable "db_multi_az" {
  description = "Create a standby DB instance in another AZ"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Skip the final snapshot on destroy (set false for production)"
  type        = bool
  default     = true
}
