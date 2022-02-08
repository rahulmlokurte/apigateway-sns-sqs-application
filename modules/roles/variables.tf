variable "api_gateway_role_list" {
  description = "List of AWS Managed IAM policies to attach to APIGatewayRole. Note: Service Roles need to include 'service-role/`"
  type        = list(string)
  default = [
    "service-role/AWSLambdaRole",
    "AmazonSNSFullAccess",
    "AmazonAPIGatewayInvokeFullAccess"
  ]
}