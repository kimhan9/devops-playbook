region               = "ap-southeast-1"
project              = "isis"
environment          = "dev"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
app_subnet_cidrs     = ["10.0.3.0/24", "10.0.4.0/24"]
db_subnet_cidrs      = ["10.0.5.0/24", "10.0.6.0/24"]
instance_type        = "t3.small"
web_asg_size         = { min = 1, desired = 2, max = 4 }
app_asg_size         = { min = 1, desired = 2, max = 4 }
app_port             = 8080
db_instance_class    = "db.t3.small"
db_allocated_storage = 20
db_name              = "sqldb"
db_username          = "dbadmin"
