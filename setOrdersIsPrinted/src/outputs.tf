output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets_id" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets_id
}

output "security_group_redis_id" {
  description = "The ID of the security group of elasticache redis"
  value       = module.security_group.sg_redis_id
}

output "security_group_lambda_id" {
  description = "The ID of the security group of lambda redis"
  value       = module.security_group.sg_lambda_redis_id
}

output "sqs_queue_url" {
  description = "The URL of the SQS queue"
  value       = module.sqs.queue_url
}

output "sqs_deadletter_queue_url" {
  description = "The URL of the SQS dead-letter queue"
  value       = module.sqs.deadletter_queue_url
}

output "elasticache_cluster_id" {
  description = "The ID of the ElastiCache cluster"
  value       = module.elastiCache.cluster_id
}

output "elasticache_endpoint" {
  description = "The primary endpoint of the ElastiCache cluster"
  value       = module.elastiCache.endpoint
}

output "elasticache_port" {
  description = "The port of the ElastiCache cluster"
  value       = module.elastiCache.port
}

output "lambda_sqs_function_arn" {
  description = "The ARN of the Lambda function that interacts with SQS"
  value       = module.lambda.lambda_sqs_function_arn
}

output "lambda_eredis_function_arn" {
  description = "The ARN of the Lambda function that interacts with Redis"
  value       = module.lambda.lambda_eredis_function_arn
}

output "lambda_sqs_function_url" {
  description = "The URL of the Lambda function that interacts with SQS"
  value       = module.lambda.lambda_sqs_function_url
}