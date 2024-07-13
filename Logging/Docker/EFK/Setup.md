# EFK Logging Stack with Docker Compose

This guide provides step-by-step instructions for setting UP Elasticsearch, Fluentd, and Kibana (EFK stack) using Docker Compose:

## Prerequisites

- Docker and Docker Compose installed on your host machine
- Basic understanding of Docker and containerization concepts

## Steps

1. Create a folder and other sub-folders to be working in:

```bash
mkdir -p EFK-Stack/fluentd/conf
```

1. Create a file named `docker-compose.yml` in the created main folder:

```bash
cd EFK-Stack
nano docker-compose.yml
```

2. Create a file named `fluentd.conf` in the fluentd/conf sub-folder:

```bash
nano fluentd/conf/fluentd.conf
```

3. Start containers 

```bash
docker-compose up -d
```

4. Open up Kibana's ui on http://<ipaddress>:5601