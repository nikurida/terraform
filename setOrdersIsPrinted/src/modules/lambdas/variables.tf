variable "elasticache_arn" {
  description = "The ARN of the elasticache"
  type        = string  
}

variable "sqs_arn" {
  description = "The ARN of the SQS"
  type        = string  
}

variable "lambda_eredis_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_sqs_function_name" {
  description = "The name of the Lambda function"
  type        = string
}
variable "lambda_handler_eredis" {
  description = "The handler for the Lambda function"
  type        = string
}

variable "lambda_handler_sqs" {
  description = "The handler for the Lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime for the Lambda function"
  type        = string
}

variable "lambda_filename_eredis" {
  description = "The filename of the Lambda function code"
  type        = string
}

variable "lambda_filename_sqs" {
  description = "The filename of the Lambda function code"
  type        = string
}

variable "subnets" {
  description = "Subnets IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}
