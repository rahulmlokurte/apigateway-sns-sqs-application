# Integration of Api Gateway with SNS and SQS using Terraform

This repository consist of a simple application that uses AWS API Gateway to push the message
to SNS and then SQS subscribes to the SNS topic.

## Run the application

- Clone the [apigateway-sns-sqs-application](https://github.com/rahulmlokurte/apigateway-sns-sqs-application) GitHub repository.
- Run the following commands in sequence to deploy the application using Terraform.
    - `terraform init`
    - `terraform plan -out output.plan`
    - `terraform apply "output.plan"`

Resources Deployed:

- It will deploy an API gateway with the GET endpoint at '/sendMessage' where the parameters are
`TopicArn` and `Message`. Where **TopicArn** is the SNS topic ARN and **Message** is the message to be sent.

- It will deploy an SNS topic with the name `workfall-sns`.

- It will create an SQS topic with the name `workfall-sqs` and it subscribes to the SNS topic `workfall-sns`.