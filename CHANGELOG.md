# Documentation for Code Change and Architecture

## Table of Contents

1. [Introduction](#introduction)
2. [Summary of Changes](#summary-of-changes)
3. [Detailed Description of Changes](#detailed-description-of-changes)
4. [Architecture Overview](#architecture-overview)
5. [Contact Information](#contact-information)

## Introduction

Provide a brief introduction to the document, explaining the context and importance of the changes and architectural details being documented.

## Summary of Changes
- Change image version from version 2.5.1 to latest in `compose.yaml`.
- Environment variable for database connection in `compose.yaml`.
- Standardization of mapped volumes in `compose.yaml`.
- Change Postgres user to use airflow in `compose.yaml`.
- Change port for healthcheck in `compose.yaml`.
- Correction of the python code for executing the dag in `smooth.py`.

## Detailed Description of Changes

1. **Change image version from version 2.5.1 to latest**
    - Old Code:
    ```yml
        image: ${AIRFLOW_IMAGE_NAME:-apache/airflow:2.5.1}
    ```
    - New Code:
    ```yml
        image: ${AIRFLOW_IMAGE_NAME:-apache/airflow:latest}
    ```

2. **Environment variable for database connection**
    - Old Code:
    ```yml
        AIRFLOW__DATABASE__SQL_ALCHEMY_CONN: postgresql+psycopg2://airflow:airflow@postgres/airflow
    ```
    - New Code:
    ```yml
        AIRFLOW__CORE__SQL_ALCHEMY_CONN: postgresql+psycopg2://airflow:airflow@postgres/airflow
    ```

3. **Standardization of mapped volumes**
    - Old Code:
    ```yml
        volume:
            - ./dag:/opt/airflow/dags
    ```
    - New Code:
    ```yml
        volume:
            - ./dags:/opt/airflow/dags
    ```

4. **Change Postgres user to use airflow**
    - Old Code:
    ```yml
        environment:
            POSTGRES_USER: admin
    ```
    - New Code:
    ```yml
        environment:
            POSTGRES_USER: airflow
    ```

5. **Change port for healthcheck**
    - Old Code:
    ```yml
        healthcheck:
            test: ["CMD", "curl", "--fail", "http://localhost:xxxx/health"]
    ```
    - New Code:
    ```yml
        healthcheck:
            test: ["CMD", "curl", "--fail", "http://localhost:8080/health"]
    ```

6. **Correction of the python code for executing the dag**
    - Old Code:
    ```python
        def smooth()
    ```
    - New Code:
    ```python
        def smooth():
    ```

## Architecture Overview

Provide an overview of an Airflow architecture deployed on AWS, highlighting the roles and interactions of various AWS services such as S3, RDS PostgreSQL, ElastiCache Redis, ECS, API Gateway, Route 53, and CloudFront.

![Alt text](architecture.png "Architecture")

- **S3 (Simple Storage Service)**: It is used for storing data and files that Airflow workflows require.

- **RDS PostgreSQL (Relational Database Service)**: Serves as the metadata database for Airflow. It stores information about the DAGs, task instances, and their states.

- **ElastiCache Redis**: It is used as a caching layer to store intermediate results, session data, and other transient information that Airflow requires for quick access.


- **ECS (Elastic Container Service)**: It is used to run Airflow’s components (web server, scheduler, and workers) in Docker containers. It orchestrates the deployment and scaling of these containers.

- **API Gateway**: Exposes Airflow’s REST API to external clients, allowing them to interact with the Airflow service (e.g., triggering DAGs, checking status).

- **Route 53**: Manages DNS routing to direct client requests to the appropriate AWS resources, ensuring low-latency and reliable connections.

- **CloudFront**: It is used as a CDN to distribute static content (e.g., web server UI assets) from S3 to clients globally, reducing latency.


## Contact Information
- **Hugo Valin** (Platform Engineer) - hugog.valin@gmail.com

