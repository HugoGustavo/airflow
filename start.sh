#!/bin/bash

COMPOSE_FILE=compose.yaml
AIRFLOW_INIT=airflow-init

# Verifica se o Docker Compose está instalado
if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose não está instalado. Instale-o e tente novamente..."
    exit 1
fi

# Verifica se o arquivo existe
if [ ! -f "$COMPOSE_FILE" ]; then
    echo "Arquivo $COMPOSE_FILE não encontrado!"
    exit 1
fi

# Removendo configuracoes antigas do Airflow
echo "Removendo configuracoes antigas do Airflow..."
docker-compose down

# Configurando Airflow
echo "Configurando Airflow..."
docker-compose -f $COMPOSE_FILE up $AIRFLOW_INIT

# Verifica se o Docker Compose foi iniciado corretamente
if [ $? -eq 0 ]; then
    echo "Airflow configurado com sucesso..."
else
    echo "Falha ao configurar Airflow..."
    echo "Exibindo logs de configuracao Airflow..."
    docker-compose logs -f
    exit 1
fi

# Iniciando Airflow
echo "Iniciando Airflow..."
docker-compose -f $COMPOSE_FILE up

# Verifica se o Docker Compose foi iniciado corretamente
if [ $? -eq 0 ]; then
    echo "Airflow iniciado com sucesso..."
else
    echo "Falha ao iniciar Airflow..."
    echo "Exibindo logs de inicializacao Airflow..."
    docker-compose logs -f
    exit 1
fi

exit 0
