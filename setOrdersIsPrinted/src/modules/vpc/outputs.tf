output "private_subnets_id" {
    value = data.aws_subnet_ids.private.ids
}

output "vpc_id" {
    value = data.aws_vpc.multipedidos-vpc.id
}

output "vpc_cidr_block" {
    value = data.aws_vpc.multipedidos-vpc.cidr_block
}
