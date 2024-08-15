resource "aws_security_group" "sg_eredis" {
  name        = "sg-lambda-eredis"
  description = "Security Group for Elasticache Redis"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "sg_lambda_eredis" {
  name        = "sg-lambda-eredis"
  description = "Security Group for Lambda to Redis and SQS"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_vpc_connections" {
  security_group_id = aws_security_group.sg_eredis.id
  cidr_ipv4         = var.vpc_cidr_block
  from_port         = 6379
  ip_protocol       = "tcp"
  to_port           = 6379
}
