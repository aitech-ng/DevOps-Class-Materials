# ELK Logging Stack with Docker Compose

This guide provides step-by-step instructions for setting UP Elasticsearch, Logstash, Filebeat, and Kibana (ELK stack with Filebeat) using Docker Compose:

## Prerequisites

- Docker and Docker Compose installed on your host machine
- Basic understanding of Docker and containerization concepts

## Steps

1. Create a folder and other sub-folders to be working in:

```bash
mkdir -p ELK-Stack/filebeat ELK-Stack/logstash
```

2. Create a file named `docker-compose.yml` in the created main folder:

```bash
cd ELK-Stack
nano docker-compose.yml
```

3. Create a file named `logstash.conf` in the logstash sub-folder:

```bash
nano logstash/logstash.conf
```

4. Create a file named `logstash.yml` in the logstash sub-folder:

```bash
nano logstash/logstash.yml
```

5. Create a file named `filebeat.yml` in the filebeat sub-folder:

```bash
nano filebeat/filebeat.yml
```

6. Start containers 

```bash
docker-compose up -d
```

7. Open up Kibana's ui on http://<ipaddress>:5601