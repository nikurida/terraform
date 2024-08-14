variable "name" {
    description = "The name of the SQS queue"
    type        = string
}

variable "deadletter_name" {
    description = "The name of the deadletter SQS queue"
    type        = string
}