# Docker Compose Commands

This guide covers essential Docker commands and operations.

Start services defined in docker-compose.yml:

```bash
docker-compose up
```
Start services defined in docker-compose.yml and build the Dockerfiles: 

```bash
docker-compose up --build
```

Start services defined in docker-compose.yml: (Flags: -d: Run in detached mode)

```bash
docker-compose up -d
```

Start services defined in docker-compose.yml: (Flags: --force-recreate: Force the recreation of the containers)

```bash
docker-compose up --force-create
```

Stop and remove containers, networks, and volumes: (Flags: -v: Remove named volumes declared in the volumes section)

```bash
docker-compose down -v
```

View logs of services: (Flags: -f: Follow log output)

```bash
docker-compose logs -f service_name
```

List containers:

```bash
docker-compose ps
```

Run a command in a service container: (Flags: -T: Disable pseudo-tty allocation)

```bash
docker-compose exec -T service_name command
```

Build or rebuild services: (Flags: --no-cache: Do not use cache when building the image)

```bash
docker-compose build --no-cache
```

Pull images for services:

```bash
docker-compose pull
```

Restart services:

```bash
docker-compose restart
```

Scale a service: (Flags: --scale: Scale services to a specific number of instances. Note: if you will do this you can't map the ports of the service to a port on the host and you can't specify a container name for the service) 

```bash
docker-compose up -d --scale backend=3
```

Run a one-off command on a service: (Flags: --rm: Remove container after run)

```bash
docker-compose run --rm service_name command
```

Stop running containers without removing them:

```bash
docker-compose stop
```

Remove stopped service containers: (Flags: -f: Don't ask for confirmation)

```bash
docker-compose rm -f
```

List networks:

```bash
docker-compose network ls
```

Inspect a network:

```bash
docker-compose network inspect network_name
```

Remove a network:
    
```bash
docker-compose network rm network_name
```