resource "aws_s3_bucket" "backup" {
  bucket = "my-backup-bucket-${random_id.bucket_suffix.hex}"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id      = "expire_backups"
    enabled = true

    expiration {
      days = var.backup_retention_days
    }

    noncurrent_version_expiration {
      days = var.backup_retention_days
    }
  }

  tags = {
    Name        = "BackupBucket"
    Environment = "Production"
  }
}

resource "aws_iam_policy" "backup_uploader_policy" {
  name        = "BackupUploaderPolicy"
  description = "Allow upload to S3 backup bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "s3:PutObject",
        Resource  = "${aws_s3_bucket.backup.arn}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "backup_uploader_attach" {
  role       = var.backup_uploader_role
  policy_arn = aws_iam_policy.backup_uploader_policy.arn
}
