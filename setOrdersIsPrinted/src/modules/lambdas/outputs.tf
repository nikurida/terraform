output "setIsPrintedLambda_eredis_arn" {
  value = aws_lambda_function.setIsPrintedLambda_eredis.arn
}

output "setIsPrintedLambda_sqs" {
  value = aws_lambda_function.setIsPrintedLambda_sqs.arn
}

output "setIsPrintedLambda_eredis_url" {
  value = aws_lambda_function_url.setIsPrintedLambda_eredis_url.url
}

output "setIsPrintedLambda_sqs_url" {
  value = aws_lambda_function_url.setIsPrintedLambda_sqs_url.url
}