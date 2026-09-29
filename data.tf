data "aws_s3_bucket" "bucket_existente" {
    bucket = aws_s3_bucket.meu_bucket.bucket
}

data "aws_availability_zones" "available" {
    state = "available"
}