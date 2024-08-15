locals {

  setOrderIsPrinted_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        resources = ["arn:aws:logs:*:*:*"]
      },
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ec2:AssignPrivateIpAddresses",
          "ec2:UnassignPrivateIpAddresses"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Resource = var.sqs_arn
      },
      {
        Effect = "Allow"
        Action = [
          "elasticache:Get*",
          "elasticache:List*",
          "elasticache:Describe*",
          "elasticache:CreateSnapshot",
          "elasticache:DeleteSnapshot"
        ]
        Resource = var.elasticache_arn
      },
      {
        Effect = "Allow"
        Action = [
          "elasticache:Connect",
          "elasticache:Discover",
          "elasticache:UpdateCluster",
          "elasticache:UpdateParameterGroup",
          "elasticache:ModifyCacheCluster"
        ]
        Resource = var.elasticache_arn
      }
    ]
  }
}
