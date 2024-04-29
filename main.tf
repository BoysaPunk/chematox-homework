provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source       = "./modules/vpc"
  region       = var.aws_region
  vpc_cidr     = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs         = var.azs
}

module "s3_bucket" {
  source              = "./modules/s3_bucket"
  backup_retention_days = var.backup_retention_days
  backup_uploader_role = var.backup_uploader_role
}
