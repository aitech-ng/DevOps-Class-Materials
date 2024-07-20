# Setting up Prometheus Monitoring Stack on Ubuntu 24 with docker-compose

This guide provides instructions for setting up Prometheus, Grafana, Node Exporter, cAdvisor, Blackbox Exporter, and Alert Manager on an Ubuntu 24 server using Docker.

## Prerequisites

- Ubuntu 24 server
- Docker and Docker Compose installed (refer to the previous guide for installation)

## Setup

1. Create a new directory for your monitoring stack:

```bash
mkdir monitoring-stack
cd monitoring-stack
```
2. Create a docker-compose.yml file:

```bash
nano docker-compose.yml
```

3. Create a Prometheus configuration file:

```bash
mkdir prometheus
nano prometheus/prometheus.yml
```

4. Create the alert rules file:

```bash
nano prometheus/alert_rules.yml
```

5. Create an Alert Manager configuration file:

```bash
mkdir alertmanager
nano alertmanager/alertmanager.yml
```

6. Start the containers:

```bash
docker-compose up -d
```

7. Verify that Grafana is running on http://ipaddress:3000 and login with credentials: username: admin, password: admin


8. Verify prometheus is running on http://ipaddress:9090 and confirm the targets are up by checking: Status > Targets


### Grafana Dashboad ids

Blackbox exporter
7587

Node exporter
1860

CAdvisor
11600

Alerts
16420

Node exporter and CAdvisor
179