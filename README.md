# Airflow with Docker Compose

This repository contains a setup for running Apache Airflow using Docker Compose. It includes everything needed to get Airflow up and running in a containerized environment.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Apache Airflow is a platform to programmatically author, schedule, and monitor workflows. This setup uses Docker Compose to make it easy to start and manage Airflow in a containerized environment, simplifying the process of deployment and management.

## Features

- Easy setup with Docker Compose
- Customizable Airflow configuration
- Pre-configured with PostgreSQL as the metadata database

## Requirements

- Docker
- Docker Compose

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/HugoGustavo/airflow.git
    cd airflow
    ```

2. Configure and initialize the Airflow:

    ```bash
    chmod +x start.sh && ./start.sh
    ```

## Usage

Access the Airflow web interface at `http://localhost:8080`. The default login credentials are:

- Username: `airflow`
- Password: `airflow`

To stop all services:

```bash
chmod +x stop.sh && ./stop.sh
```

### Customizing DAGs

Place your DAG files in the `./dags` directory. They will be automatically detected and loaded by Airflow.

### Plugins

Place your custom plugins in the `./plugins` directory.

## Folder Structure

```
.
├── dags/           # Directory for DAG files
├── logs/           # Directory for logs
├── plugins/        # Directory for custom plugins
├── .gitignore
├── compose.yaml
├── LICENSE
├── README.md
├── start.sh
└── stop.md
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss what you would like to change.

## License

This project is licensed under the Apache License. See the [LICENSE](LICENSE) file for details.
