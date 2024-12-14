terraform {
  backend "local" {
    path = "local-terraform-state/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-central-1"
}

locals {
    service_name = "service"
}

module "dynamodb" {
    source = "./dynamodb"

    service_name = local.service_name
}

module "lambda" {
    source = "./lambda"

    service_name           = local.service_name
    dynamodb_arn           = module.dynamodb.dynamodb_arn
    vpc_subnet_ids         = var.vpc_subnet_ids
    vpc_security_group_ids = var.vpc_security_group_ids
}

module "api_gateway" {
    source = "./api-gateway"

    service_name           = local.service_name
    lambda_arn             = module.lambda.lambda_arn
    lambda_name            = module.lambda.lambda_name
    vpc_security_group_ids = var.vpc_security_group_ids
    vpc_subnet_ids         = var.vpc_subnet_ids
}
