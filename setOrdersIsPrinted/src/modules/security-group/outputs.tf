output "sg_redis_id" {
   value = aws_security_group.sg_eredis.id
}

output "sg_lambda_redis_id" {
   value = aws_security_group.sg_lambda_eredis.id
}