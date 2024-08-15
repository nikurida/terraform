terraform {

  required_version = "1.9.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security-group"

  vpc_id = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
}

module "sqs" {
  source = "./modules/sqs"

  name = "setOrderIsPrinted.fifo"
  deadletter_name = "setOrderIsPrinted_deadletter"
}

module "elastiCache" {
  source = "./modules/elasticache"

  engine = "redis"
  name = "setOrderIsPrinted_redis"
  security_group_ids = [module.security_group.sg_redis_id]
  subnet_ids = module.vpc.private_subnets_id
}

module "lambda" {
  source = "./modules/lambdas"

  # Variáveis da VPC e Security Group
  elasticache_arn = module.elastiCache.elasticache_arn
  sqs_arn = module.sqs.sqs_arn
  subnets           = module.vpc.private_subnets_id
  security_group_id = module.security_group.sg_lambda_redis_id

  # Definições para a Lambda SQS
  lambda_sqs_function_name = "setIsPrintedLambda_sqs"
  lambda_handler_sqs       = "index.handler"
  runtime                  = "nodejs20.x"
  lambda_filename_sqs      = "lambda_set_is_printed_sqs.zip"

  # Definições para a Lambda Redis
  lambda_eredis_function_name = "setIsPrintedLambda_eredis"
  lambda_handler_eredis       = "index.handler"
  lambda_filename_eredis      = "lambda_set_is_printed_redis.zip"
}
