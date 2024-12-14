resource "aws_apigatewayv2_api" "api_gateway" {
  name          = "${var.service_name}-api"
  description   = "The API Gateway for Service"
  protocol_type = "HTTP"
  version       = 1
  tags          = {
    service_name = var.service_name
  }
}

resource "aws_apigatewayv2_integration" "api_gateway_integration" {
  api_id           = aws_apigatewayv2_api.api_gateway.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  description               = "Endpoint that initiates lambda"
  integration_method        = "POST"
  integration_uri           = var.lambda_arn
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_vpc_link" "vpc-link" {
  name               = "${var.service_name}-vpc-link"
  security_group_ids = var.vpc_security_group_ids
  subnet_ids         = var.vpc_subnet_ids

  tags = {
    service_name = var.service_name
  }
}

resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.api_gateway.execution_arn}/*/POST"
}