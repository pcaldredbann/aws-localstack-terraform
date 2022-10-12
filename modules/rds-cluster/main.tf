resource "aws_rds_cluster" "this" {
  cluster_identifier      = var.context_name
  engine                  = var.engine
  engine_version          = var.engine_version
  availability_zones      = var.az_names
  database_name           = var.db_name
  master_username         = var.username
  master_password         = var.password
  backup_retention_period = 0
  preferred_backup_window = "07:00-09:00"
  # the following are needed explicitly if not configuring a final snapshot
  # as there is a persistent bug that prevents destroying this resource if not
  # see: https://github.com/hashicorp/terraform-provider-aws/issues/2588
  skip_final_snapshot = true
  apply_immediately   = true
}
