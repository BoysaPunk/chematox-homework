This Terraform project sets up a VPC and an S3 bucket in AWS. The VPC includes public and private subnets across multiple availability zones, suitable for hosting scalable and highly available applications. The S3 bucket is configured for secure backups, enforcing best practices such as encryption, versioning, and lifecycle management to automatically delete old backups.

VPC Module: Handles the creation of VPC, subnets, and related networking resources.

S3 Bucket Module: Configures an S3 bucket specifically for backups, including security settings and lifecycle rules.
