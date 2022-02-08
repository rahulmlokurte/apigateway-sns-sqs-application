data "template_file" "workfall_sqs" {
  template = file("${path.module}/template/workfall_sqs_policy.json")
  vars = {
    workfall_sqs_arn = aws_sqs_queue.workfall_sqs.arn
  }
}