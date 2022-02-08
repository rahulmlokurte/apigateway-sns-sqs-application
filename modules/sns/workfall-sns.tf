resource "aws_sns_topic" "workfall_sns" {
  name = "workfall-sns"
  display_name = "workfall-sns"
  fifo_topic = false
}