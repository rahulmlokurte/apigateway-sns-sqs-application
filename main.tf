terraform {
  required_providers {
    aws      = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
    archive  = {
      source  = "hashicorp/archive"
      version = "~> 2.1"
    }
  }
}

provider "aws" {
  region                  = var.aws_region
  profile                 = var.profile
  shared_credentials_file = var.shared_credentials_file
}

module "api_gateways" {
  source               = "./modules/api_gateways"
  aws_region           = var.aws_region
  api_gateway_role_arn = module.roles.api_gateway_role_arn
}

module "roles" {
  source = "./modules/roles"
}

module "sns" {
  source = "./modules/sns"
}

module "sqs" {
  source = "./modules/sqs"
}