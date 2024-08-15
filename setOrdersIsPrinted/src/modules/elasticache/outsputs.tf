output "elasticache_endpoint" {
    value = aws_elasticache_serverless_cache.setIsPrinted-redis.endpoint
}

output "elasticache_arn" {
  value = aws_elasticache_serverless_cache.setIsPrinted-redis.arn
}