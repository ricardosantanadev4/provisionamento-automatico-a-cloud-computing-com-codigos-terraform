/*
output "nome" {
    value = tipo_recurso.nome_do_recurso.atributo
}
*/
output "nome_do_bucket" {
    value = aws_s3_bucket.meu_bucket.bucket
}

output "id_bucket" {
    value = aws_s3_bucket.meu_bucket.id
}

// ============= com datasource ==============

output "aws_availability_zones" {
    value = data.aws_availability_zones.available.names
}

output "bucket_existente" {
    value = data.aws_s3_bucket.bucket_existente.arn
}

