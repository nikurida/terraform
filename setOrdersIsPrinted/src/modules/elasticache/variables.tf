variable "name" {
    description = "The name of the elasticache"
    type        = string
}

variable "engine" {
    description = "The name of the engine"
    type        = string
}

variable "subnet_ids" {
    description = "The id of the subnets"
    type        = list(string)
}

variable "security_group_ids" {
    description = "The security group ids"
    type        = list(string)
}