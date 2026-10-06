resource "aws_db_subnet_group" "main" {
  name_prefix = "${var.project}-db-"
  description = "Subnet group for the database"
  subnet_ids  = aws_subnet.db[*].id

  tags = { Name = "${var.project}-db-subnets" }
}

resource "aws_db_instance" "main" {
  identifier        = "${var.project}-db"
  engine            = "mysql"
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  # RDS generates the password and stores it in Secrets Manager (not in state/code).
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db.id]
  multi_az               = var.db_multi_az
  publicly_accessible    = false

  backup_retention_period = 7
  skip_final_snapshot     = var.db_skip_final_snapshot
  # Only used when skip_final_snapshot is false.
  final_snapshot_identifier = var.db_skip_final_snapshot ? null : "${var.project}-db-final"
}
