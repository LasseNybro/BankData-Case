variable "service_name" {
    type        = string
    description = "Name of the service"
}

variable "lambda_arn" {
    type        = string
    description = "Arn of the lambda to be invoked"
}

variable "lambda_name" {
    type        = string
    description = "Name of the lambda to be invoked"
}

variable "vpc_security_group_ids" {
    type        = list(string)
    description = "List of security group ids"
}

variable "vpc_subnet_ids" {
    type        = list(string)
    description = "List of aws subnet ids"
}
