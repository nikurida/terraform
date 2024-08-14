output "sqs_url" {
  value = aws_sqs_queue.setOrderIsPrinted.url
}

output "sqs_arn" {
  value = aws_sqs_queue.setOrderIsPrinted.arn
}

output "sqs_deadletter_url" {
  value = aws_sqs_queue.setOrderIsPrinted_queue_deadletter.url
}

output "sqs_id"{
  value = aws_sqs_queue.setOrderIsPrinted.id
}