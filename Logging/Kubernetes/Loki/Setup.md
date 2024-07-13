# Setting up Loki Stack on Kubernetes

This guide provides instructions for setting up the Loki stack (Loki, Promtail, Grafana) on Kubernetes.

## Prerequisites

- A running Kubernetes cluster
- kubectl configured to interact with your cluster
- Helm 3 installed

## Setup

1. Add the Grafana Helm repository:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

2. Create a namespace for Loki:

```bash
kubectl create namespace loki
```

3. Install Loki stack:

```bash
helm install loki grafana/loki-stack \
  --namespace loki \
  --set grafana.enabled=true,prometheus.enabled=true,prometheus.alertmanager.persistentVolume.enabled=false,prometheus.server.persistentVolume.enabled=false
```

3. Accessing Grafana, Get the admin password:

```bash
kubectl get secret --namespace loki loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

4. Port-forward the Grafana service:

```bash
kubectl port-forward --namespace loki service/loki-grafana 3000:80
```

5. Access Grafana at http://localhost:3000 and login with admin and the password from step 1.

## Configuring Grafana to Use Loki

6. In Grafana, go to Configuration > Data Sources.

7. Add a new data source and select Loki.

8. Set the URL to http://loki:3100 and save.

9. Verifying the Setup, Check the status of the pods:

```bash
kubectl get pods -n loki
```

10. View logs from Promtail:

```bash
kubectl logs -n loki -l app=promtail -f
```

In Grafana, go to Explore and select Loki as the data source to start querying logs.

Notes:

- For production use, configure persistent storage for Loki.
- Adjust resource requests and limits based on your cluster's capacity.
- Consider setting up retention policies and index periods for log management.

