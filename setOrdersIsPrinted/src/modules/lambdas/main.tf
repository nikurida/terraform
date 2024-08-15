  resource "aws_iam_role" "lambda_role" {
    name               = "lambda_execution_role"
    assume_role_policy = jsonencode(data.aws_iam_policy_document.assume_role)
  }

  resource "aws_iam_policy" "lambda_policy" {
    name        = "lambda_setOrderIsPrinted_policy"
    description = "IAM policy for Lambda to access DynamoDB and CloudWatch Logs"
    policy      = jsonencode(local.setOrderIsPrinted_policy)
  }

  resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
    role       = aws_iam_role.lambda_role.name
    policy_arn = aws_iam_policy.lambda_policy.arn
  }

  resource "aws_lambda_function" "setIsPrintedLambda_sqs" {
    function_name    = var.lambda_sqs_function_name
    role             = aws_iam_role.lambda_role.arn
    handler          = var.lambda_handler_sqs
    runtime          = var.runtime
    filename         = var.lambda_filename_sqs
    source_code_hash = filebase64sha256(var.lambda_filename_sqs)
  }

  resource "aws_lambda_function" "setIsPrintedLambda_eredis" {
    function_name    = var.lambda_eredis_function_name
    role             = aws_iam_role.lambda_role.arn
    handler          = var.lambda_handler_eredis
    runtime          = var.runtime
    filename         = var.lambda_filename_eredis
    source_code_hash = filebase64sha256(var.lambda_filename_eredis)

    vpc_config {
      subnet_ids         = var.subnets
      security_group_ids = [var.security_group_id]
    }
  }

  resource "aws_lambda_function_url" "setIsPrintedLambda_sqs_url" {
    function_name      = aws_lambda_function.setIsPrintedLambda_sqs.function_name
    qualifier          = "setIsPrintedLambda_sqs"
    authorization_type = "AWS_IAM"

    cors {
      allow_credentials = true
      allow_origins     = ["*"]
      allow_methods     = ["*"]
      allow_headers     = ["date", "keep-alive"]
      expose_headers    = ["keep-alive", "date"]
      max_age           = 86400
    }
  }