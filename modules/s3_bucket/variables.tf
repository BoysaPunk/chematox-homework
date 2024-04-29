variable "backup_retention_days" {
  type        = number
  description = "Number of days to retain the backups in the S3 bucket"
}

variable "backup_uploader_role" {
  type        = string
  description = "IAM role ARN that will be given permissions to upload to the S3 bucket"
}
