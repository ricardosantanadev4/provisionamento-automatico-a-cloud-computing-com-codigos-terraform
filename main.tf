terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region

default_tags {
    tags = {
      Ambiente      = var.ambiente
      Projeto       = "provisionamento-automatico"
      GerenciadoPor = "Terraform"
    }
  }
}

resource "aws_s3_bucket" "meu_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "meu_bucket" {
  bucket = aws_s3_bucket.meu_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "meu_bucket" {
  bucket = aws_s3_bucket.meu_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "meu_bucket" {
  bucket                  = aws_s3_bucket.meu_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
