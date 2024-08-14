resource "aws_security_group" "sg-eredis" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = aws_vpc.main.id
}