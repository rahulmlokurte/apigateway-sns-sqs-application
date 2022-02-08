data "template_file" "workflow_sns" {
  template = file("${path.module}/template/workfall_sns_policy.json")
  vars = {
    workfall_sns_arn = aws_sns_topic.workfall_sns.arn
  }
}