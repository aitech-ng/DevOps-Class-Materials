# Setting up Nagios using Docker Compose on Ubuntu 24

This guide provides instructions for setting up Nagios Core using Docker Compose on an Ubuntu 24 server.

## Prerequisites

- Ubuntu 24 server
- Docker and Docker Compose installed (refer to the Docker installation guide if needed)

## Setup

1. Create a new directory for your Nagios setup:

```bash
mkdir nagios-docker
cd nagios-docker
```

2. Create a docker-compose file:

```bash
nano docker-compose.yml
```

2. Create the relevant folders:

```bash
mkdir plugins config
```

3. Start container:

```bash
docker-compose up -d
```

### Open nagios core on http://<ipaddress>:8080/nagios and login with credentials; username: nagionsadmin, password: nagios

