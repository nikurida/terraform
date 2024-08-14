variable "region" {
  description = "The AWS region"
  type        = string
}

variable "profile" {
  description = "User profile"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  type        = string
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  type        = string
}

variable "lambda_filename" {
  description = "The filename of the Lambda function code"
  type        = string
}