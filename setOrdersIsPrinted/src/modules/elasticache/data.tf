data "aws_subnets" "multipedidos-vpc-subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_kms_key" "by_key_arn" {
  key_id = var.kms_key_alias
}