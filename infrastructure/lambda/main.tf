resource "aws_lambda_function" "lambda" {
  filename      = "lambda-code.zip"
  function_name = var.service_name
  role          = aws_iam_role.lambda_iam.arn
  handler       = "index.handler"
  runtime       = "nodejs20.x"

  vpc_config {
    security_group_ids = var.vpc_security_group_ids
    subnet_ids         = var.vpc_subnet_ids
  }
}

resource "aws_iam_role" "lambda_iam" {
  name = "${var.service_name}-lambda-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect: "Allow",
        Action: [
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:BatchWriteItem",
          "dynamodb:GetItem",
          "dynamodb:BatchGetItem",
          "dynamodb:Scan",
          "dynamodb:Query",
          "dynamodb:ConditionCheckItem"
        ],
        Resource: [
          var.dynamodb_arn,
          "var.dynamodb_arn/*"
        ]
      },
    ]
  })
}