variable "region" {
    description = "Regiao onde os arquivos serao criados"
    default = "sa-east-1"
    type = string

    validation {
        condition = contains(["us-east-1", "us-east-2", "us-west-2", "sa-east-1"], var.region)
        error_message = "Região inválida. Escolha entre: us-east-1, us-east-2, us-west-2 ou sa-east-1."
    }
}

variable "bucket_name" {
    type = string
    description = "Nome do meu bucket"
}

variable "ambiente" {
  type = string
  description = "O ambiente de implantação do projeto."
  default = "dev"
  
  sensitive = false
  nullable = false
  ephemeral = false

  # Garante que o usuário só digite uma das três opções válidas
  validation {
    condition = contains(["dev", "staging", "prod"], var.ambiente)
    error_message = "O ambiente deve ser obrigatoriamente 'dev', 'staging' ou 'prod'."
  }
}