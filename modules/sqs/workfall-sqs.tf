resource "aws_sqs_queue" "workfall_sqs" {
  name = "workfall-sqs"

}

resource "aws_sqs_queue_policy" "workfall_sqs" {
  policy    = data.template_file.workfall_sqs.rendered
  queue_url = aws_sqs_queue.workfall_sqs.id
}