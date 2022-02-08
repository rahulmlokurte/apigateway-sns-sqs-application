data "template_file" "api_gateway_assume_role_policy" {
  template = file("${path.module}/template/api_gateway_assume_role_policy.json")
}

data "aws_partition" "current" {}