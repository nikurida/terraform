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
  "lambda_function_name": "${LAMBDA_FUNCTION_NAME}",
  "lambda_handler": "${LAMBDA_HANDLER}",
  "lambda_runtime": "${LAMBDA_RUNTIME}",
  "lambda_filename": "lambda.zip"
}
EOL

# Inicializar Terraform
terraform init
