#!/bin/bash

# Carregar variáveis de ambiente do arquivo .env
set -o allexport
source .env
set -o allexport

export AWS_REGION="us-east-1"
export AWS_PROFILE="terraform"

# Criar arquivo terraform.tfvars.json
cat > terraform.tfvars.json <<EOL
{
  "region": "${AWS_REGION}",
  "profile": "${AWS_PROFILE}",
}
EOL

# Inicializar Terraform
terraform init
