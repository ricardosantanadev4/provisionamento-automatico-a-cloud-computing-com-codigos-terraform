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
}

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
