# webdev-final-project
My project for web dev subject

Now dockerized. It won't really work as expected as my dump don't include correct views and I lost the original code ¯\\\_(ツ)_/¯

## Prerequisites

- **Docker**: Make sure you have Docker installed on your machine. You can download it from [Docker's official website](https://www.docker.com/get-started).
- **Docker Compose**: Ensure Docker Compose is installed as it is used to manage multi-container applications.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Parsyfall/webdev-final-project.git
cd webdev-final-project
```

### 2. Docker Compose Setup

You will find a `docker-compose.yml` file in the root directory of the project. This file defines the services, networks, and volumes required for the application.

### 3. Building and Running the Containers

Run the following command to build and start the containers:

```bash
docker-compose up --build
```

This command will:
- Build the Docker images as specified in the `Dockerfile`.
- Start the PHP application and MySQL database containers.

### 5. Accessing the Application

Once the containers are running, you can access the PHP application by navigating to `http://localhost:9000` in your web browser.

### 6. Database Setup

The database will automatically be created when you run the application. 

### 7. Stopping the Containers

To stop the running containers, press `CTRL+C` in the terminal where the containers are running, or run:

```bash
docker-compose down
```

### 8. Managing the MySQL Database

To access the MySQL database, you can use a phpMyAdmin (navigate to `http://localhost:8080/`) or command-line tool. You can connect to the database using the following credentials:

- **Host**: `mysql`
- **Username**: `root`
- **Password**: `example`
- **Database**: `biblioteca`
