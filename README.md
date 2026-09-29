# Provisionamento Automático a Cloud Computing com Códigos Terraform

> **Infraestrutura deixa de ser configuração manual e passa a ser código.**

Projeto que demonstra como o **Terraform** transforma o provisionamento de infraestrutura na **AWS** em um processo automatizado, reproduzível e escalável.

---

## 1. O problema

Infraestrutura não deveria depender de configuração manual.

- Processos manuais
- Maior possibilidade de erros
- Dificuldade de replicação
- Tempo operacional elevado

## 2. Nossa solução: Infraestrutura como Código (IaC)

Nossa solução utiliza o Terraform para transformar o provisionamento de infraestrutura em código.

```
Terraform
    ↓
   AWS
    ↓
Infraestrutura provisionada automaticamente
```

## 3. Como funciona: do código para a infraestrutura

```
Código Terraform
       ↓
     plan     → mostra o que será criado
       ↓
     apply    → cria os recursos
       ↓
      AWS
```

## 4. Estrutura do projeto

```
.
├── main.tf
├── variables.tf
├── terraform.tfvars
├── data.tf
└── outputs.tf
```

| Arquivo            | Função                        |
|--------------------|-------------------------------|
| `main.tf`          | Recursos e provider           |
| `variables.tf`     | Variáveis e validações        |
| `terraform.tfvars` | Valores das variáveis         |
| `data.tf`          | Consultas à AWS               |
| `outputs.tf`       | Informações após a execução   |

## 5. O que estamos provisionando

Para a demonstração, provisionamos automaticamente um **bucket Amazon S3**.

```
Terraform
    ↓
AWS Provider
    ↓
Amazon S3
    ↓
meu-bucket-aponti
```

## 6. Demonstração

Pré-requisitos: [Terraform](https://developer.hashicorp.com/terraform/install) instalado e credenciais da AWS configuradas.

```bash
git clone https://github.com/ricardosantanadev4/provisionamento-automatico-a-cloud-computing-com-codigos-terraform.git
cd provisionamento-automatico-a-cloud-computing-com-codigos-terraform

terraform init
terraform plan
terraform apply
```

Para remover os recursos criados:

```bash
terraform destroy
```

## 7. Escalabilidade da solução

O S3 é apenas o exemplo. Ele foi escolhido por ser um recurso simples e seguro para demonstrar o conceito, mas o Terraform não está limitado a ele. A mesma abordagem estrutura diferentes componentes da infraestrutura.

```
                 Terraform
                     │
       ┌─────────────┼─────────────┐
       ↓             ↓             ↓
      S3            EC2            RDS
       │             │             │
   Storage       Aplicação       Banco
```

## 8. Conclusão

**Infraestrutura deixa de ser configuração manual e passa a ser código.**

- **Automação**
- **Repetibilidade**
- **Padronização**
- **Escalabilidade**

Nosso projeto demonstra que é possível transformar o provisionamento de infraestrutura em um processo automatizado, reproduzível e escalável. Hoje mostramos um bucket S3, mas a mesma arquitetura pode evoluir para uma infraestrutura completa na AWS.
