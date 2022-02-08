resource "aws_api_gateway_rest_api" "workfall_api" {
  name = "workfall-api"
}

resource "aws_api_gateway_resource" "workfall_api" {
  parent_id   = aws_api_gateway_rest_api.workfall_api.root_resource_id
  path_part   = "sendMessage"
  rest_api_id = aws_api_gateway_rest_api.workfall_api.id
}

resource "aws_api_gateway_method" "workfall_api" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.workfall_api.id
  rest_api_id   = aws_api_gateway_rest_api.workfall_api.id
  request_parameters = {
    "method.request.querystring.TopicArn" = false
    "method.request.querystring.Message" = false
  }
}

resource "aws_api_gateway_integration" "workfall_api" {
  http_method = aws_api_gateway_method.workfall_api.http_method
  resource_id = aws_api_gateway_resource.workfall_api.id
  rest_api_id = aws_api_gateway_rest_api.workfall_api.id
  type        = "AWS"
  integration_http_method = "POST"
  uri = "arn:aws:apigateway:${var.aws_region}:sns:action/Publish"
  request_parameters = {
    "integration.request.querystring.TopicArn" = "method.request.querystring.TopicArn"
    "integration.request.querystring.Message" = "method.request.querystring.Message"
  }
  credentials = var.api_gateway_role_arn
}

resource "aws_api_gateway_deployment" "workfall_api" {
  rest_api_id = aws_api_gateway_rest_api.workfall_api.id
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "workfall_api" {
  deployment_id = aws_api_gateway_deployment.workfall_api.id
  rest_api_id   = aws_api_gateway_rest_api.workfall_api.id
  stage_name    = "workfall"
}

