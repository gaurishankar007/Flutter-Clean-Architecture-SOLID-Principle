# Docker Setup and Commands

This document provides essential Docker and Docker Compose commands for development environments.

### Prerequisites

- Ensure Docker and Docker Compose are installed on your system.

---

### 1. Setting Up Containers

- ✅ `docker-compose up -d --build`: Builds Docker images (if they don't exist or have changed) and starts the containers defined in your docker-compose.yml file in detached (background) mode.
- ✅ `docker-compose up -d`: Starts the containers defined in your docker-compose.yml file in detached mode. This assumes the images have already been built.

### 2. Interacting with Containers

- ✅ `docker compose exec -it laravel bash/sh`: Opens an interactive shell within the `laravel` container.

### 3. Managing Databases (Laravel Example)

- ✅ `docker compose exec -it laravel php artisan migrate:fresh --seed`: Drops all tables, re-runs migrations, and seeds the database in the `laravel` container.

### 4. Docker Caching

- ✅ `docker system df`: Shows how much disk space is Docker using.
- ✅ `docker system prune`: Removes everything from the Docker cache.
- ✅ `docker system prune -f`: Removes everything from the Docker cache without showing a confirmation prompt. `-f` omits the confirmation prompt.
- ✅ `docker ps --filter status=exited --filter status=dead -q`: Shows which containers are unused.
- ✅ `docker container prune -f`: Removes containers from the Docker cache.
- ✅ `docker image prune -f`: Removes images from the Docker cache.
- ✅ `docker volume prune -f`: Removes volumes from the Docker cache.
- ✅ `docker buildx prune -f`: Removes Docker build cache.

---

### Explanation of Options

- `-d`: Run containers in detached (background) mode.
- `--build`: Rebuild images if changes are detected.
- `exec -it`: Execute an interactive command within a running container.
- `migrate:fresh --seed`: Laravel Artisan command to reset and seed the database.
