resource "aws_sqs_queue" "setOrderIsPrinted" {
  name                  = var.name
  max_message_size          = 2048
  message_retention_seconds = 86400
  fifo_queue            = true
  deduplication_scope   = "messageGroup"
  fifo_throughput_limit = "perMessageGroupId"
  sqs_managed_sse_enabled = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.setOrderIsPrinted_queue_deadletter.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue" "setOrderIsPrinted_queue_deadletter" {
  name = var.deadletter_name
}

resource "aws_sqs_queue_redrive_allow_policy" "setOrderIsPrinted_queue_redrive_allow_policy" {
  queue_url = aws_sqs_queue.setOrderIsPrinted_queue_deadletter.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.setOrderIsPrinted.arn]
  })
}