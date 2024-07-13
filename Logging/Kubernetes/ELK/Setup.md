# Setting up ELK Stack with Filebeat on Kubernetes

This guide provides instructions for setting up the ELK (Elasticsearch, Logstash, Kibana) stack with Filebeat on Kubernetes.

## Prerequisites

- A running Kubernetes cluster
- kubectl configured to interact with your cluster
- Helm 3 installed

## Setup

1. Install Elasticsearch:

```bash
helm install elasticsearch elasticsearch/
```

2. Install Kibana:

```bash
helm install kibana kibana/
```

3. Install Logstash:

```bash
helm install logstash logstash/
```

4. Install Filebeat:

```bash
helm install filebeat filebeat/
```

5. Accessing Kibana, Port-forward the Kibana service:

```bash
kubectl port-forward -n elk svc/kibana-kibana 5601:5601
```

Access Kibana at http://localhost:5601


6. Verifying the Setup, Check the status of the pods:

```bash
kubectl get pods -n elk
```

7. View logs from Filebeat:

```bash
kubectl logs -n elk -l app=filebeat-filebeat -f
```

In Kibana, create an index pattern for filebeat-* to start viewing logs.

Notes:

- Adjust resource requests and limits based on your cluster's capacity.
- For production use, configure proper storage classes and persistent volumes.
- Secure your ELK stack by implementing authentication and encryption.

