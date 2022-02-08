resource "aws_sns_topic" "workfall_sns" {
  name = "workfall-sns"
  display_name = "workfall-sns"
  fifo_topic = false
}

resource "aws_sns_topic_policy" "workfall_sns" {
  arn    = aws_sns_topic.workfall_sns.arn
  policy = data.template_file.workflow_sns.rendered
}

resource "aws_sns_topic_subscription" "workfall_sns" {
  endpoint  = var.workfall_sqs_queue_arn
  protocol  = "sqs"
  topic_arn = aws_sns_topic.workfall_sns.arn
}