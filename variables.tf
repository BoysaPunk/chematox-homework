variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "A list of private subnet CIDR blocks"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "backup_retention_days" {
  description = "Number of days to retain the backups in the S3 bucket"
  default     = 180
}

variable "backup_uploader_role" {
  description = "IAM role ARN that will be given permissions to upload to the S3 bucket"
  default     = "arn:aws:iam::123456789012:role/backup_uploader"
}
