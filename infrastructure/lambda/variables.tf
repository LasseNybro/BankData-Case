variable "service_name" {
    type        = string
    description = "Name of the service"
}

variable "dynamodb_arn" {
    type        = string
    description = "Arn of the dynamo database"
}

variable "vpc_security_group_ids" {
    type        = list(string)
    description = "List of security group ids"
}

variable "vpc_subnet_ids" {
    type        = list(string)
    description = "List of aws subnet ids"
}
