variable "name" {
    description = "The name of the elasticache"
    type        = string
}

variable "engine" {
    description = "The name of the engine"
    type        = string
}

variable "vpc_id" {
    description = "The id of the vpc"
    type        = string
}

variable "kms_key_alias" {
    description = "The alias of the kms key"
    type        = string
}

variable "security_group_ids" {
    description = "The security group ids"
    type        = list(string)
}