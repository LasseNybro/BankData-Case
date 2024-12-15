resource "aws_dynamodb_table" "dynamodb_table" {
  name         = "${var.service_name}-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  tags = {
    service_name = var.service_name
  }
}