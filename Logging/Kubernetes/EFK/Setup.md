# Setting up EFK Stack (Elasticsearch, Fluentd, Kibana) on Kubernetes

This guide provides instructions for setting up the EFK stack on Kubernetes.

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

3. Install Fluentd:

```bash
helm install fluentd fluentd/
```

4. Accessing Kibana, Port-forward the Kibana service:

```bash
kubectl port-forward -n efk svc/kibana-kibana 5601:5601
```

5. Access Kibana at http://localhost:5601

6. Verifying the Setup, Check the status of the pods:

```bash
kubectl get pods -n efk
```

7. View logs from Fluentd:

```bash
kubectl logs -n efk -l app.kubernetes.io/name=fluentd -f
```

In Kibana, create an index pattern for fluentd-* to start viewing logs.

Notes:

- Adjust resource requests and limits based on your cluster's capacity.
- For production use, configure proper storage classes and persistent volumes.
- Secure your EFK stack by implementing authentication and encryption.
- Consider tuning Fluentd configuration for optimal performance and log parsing.