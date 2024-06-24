# Docker Commands

This guide covers essential Docker commands and operations.

## Important Docker Commands


docker ps: List running containers

```bash
docker ps
```

docker ps -a: List all containers

```bash
docker ps -a
```

docker run: Create and start a container

```bash
docker run -d -p 80:80 nginx
```

docker images: List available images

```bash
docker images
```

docker pull: Download an image from a registry

```bash
docker pull nginx
```

docker push: Upload an image to a registry

```bash
docker push dockerhub_username/imagename
```

docker build: Build an image from a Dockerfile

```bash
docker build -t myapp:1.0 .
```

docker build -f: Building a Specific Dockerfile

```bash
docker build -f Dockerfile.custom -t myapp:custom .
```

docker stop: Stop a running container

```bash
docker stop container_id
```

docker start: Start a stopped container

```bash
docker start container_id
```

docker rm: Remove a container

```bash
docker rm container_id
```

docker rmi: Remove an image

```bash
docker rmi image_id
```

docker exec: Execute a command in a running container

```bash
docker exec -it container_id /bin/bash
```

docker exec: Run a single command in a running container:

```bash
docker exec container_id ls /app
```

docker exec -d: Run a command in detached mode:

```bash
docker exec -d container_id long-running-command
```

docker logs: Fetch the logs of a container

```bash
docker logs container_id
```

docker logs -f: To follow the logs in real-time:

```bash
docker logs -f container_id
```
docker system prune: Remove all unused resources:

```bash
docker system prune
```

docker system prune -a volumes: Remove all unused volumes:

```bash
docker system prune -a --volumes
```

docker container prune: Remove all stopped containers:

```bash
docker container prune
```

docker image prune: Remove all dangling images:

```bash
docker image prune
```

docker volume create: Create a volume:

```bash
docker volume create my_volume
```

docker volume ls: List volumes:

```bash
docker volume ls
```

docker volume rm: Remove a volume:

```bash
docker volume rm my_volume
```

docker plugin ls: List installed plugins:

```bash
docker plugin ls
```

docker plugin install: Install a plugin:

```bash
docker plugin install [OPTIONS] PLUGIN [KEY=VALUE...]
```

docker login: Log in to a Docker registry:

```bash
docker login -u dockerhub_username -p dockerhub_password
```

docker tag: Change the image name or tag:

```bash
docker tag OldImageName NewImageName
```