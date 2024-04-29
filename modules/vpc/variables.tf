variable "region" {
  type        = string
  description = "AWS region for the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
}
