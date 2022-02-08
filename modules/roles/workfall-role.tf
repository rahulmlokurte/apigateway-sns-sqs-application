resource "aws_iam_role" "workfall_apigateway_role" {
  name                  = "workfall-apigateway-role"
  assume_role_policy    = data.template_file.api_gateway_assume_role_policy.rendered
  force_detach_policies = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "workfall_role_policy_attachment" {
  count      = length(var.api_gateway_role_list)
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/${var.api_gateway_role_list[count.index]}"
  role       = aws_iam_role.workfall_apigateway_role.name
}