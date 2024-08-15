resource "aws_elasticache_serverless_cache" "setIsPrinted-redis" {
  engine = var.engine
  name   = var.name
  cache_usage_limits {
    data_storage {
      maximum = 10
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 5000
    }
  }

  description              = "Cache for setIsPrinted Data"
  major_engine_version     = "7"
  security_group_ids       = var.security_group_ids
  subnet_ids               = var.subnet_ids
}