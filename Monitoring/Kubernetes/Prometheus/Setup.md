# Setting up Prometheus Monitoring Stack on Kubernetes

This guide provides instructions for setting up Prometheus, Grafana, AlertManager, and related tools on a Kubernetes cluster using both Helm and kubectl methods.

## Prerequisites

- A running Kubernetes cluster
- kubectl configured to interact with your cluster
- Helm 3 installed

## Method 1: Using Helm

1. Add the Prometheus community Helm repository:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

2. Create a namespace for monitoring:

```bash
kubectl create namespace monitoring
```

3. Install the kube-prometheus-stack chart:

```bash
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --set grafana.adminPassword=your-secure-password  
```

4. This chart includes Prometheus, Grafana, AlertManager, and various exporters.

5. Access Grafana:

```bash
kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80
```

Visit http://localhost:3000 and login with admin / your-secure-password.

## Method 2: Using kubectl

1. Create a monitoring namespace:

```bash
kubectl create namespace monitoring
```

2. Deploy Prometheus:

```bash
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml
```

3. Create a Prometheus instance:

```yaml
apiVersion: monitoring.coreos.com/v1
kind: Prometheus
metadata:
  name: prometheus
  namespace: monitoring
spec:
  serviceAccountName: prometheus
  serviceMonitorSelector:
    matchLabels:
      team: frontend
  ruleSelector:
    matchLabels:
      team: frontend
  resources:
    requests:
      memory: 400Mi
```

4. Apply with:

```bash
kubectl apply -f prometheus-instance.yaml
```

5. Deploy Grafana:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana
  namespace: monitoring
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
      - name: grafana
        image: grafana/grafana:latest
        ports:
        - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: grafana
  namespace: monitoring
spec:
  selector:
    app: grafana
  ports:
    - port: 3000
```

6. Apply with:

```bash
kubectl apply -f grafana-deployment.yaml
```

## Setting up ServiceMonitors: ServiceMonitors allow Prometheus to automatically discover and scrape metrics from your services.

1. Create a ServiceMonitor for an example app:

```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: example-app
  namespace: monitoring
  labels:
    team: frontend
spec:
  selector:
    matchLabels:
      app: example-app
  endpoints:
  - port: web
```

2. Apply with:

```bash
kubectl apply -f servicemonitor.yaml
```

## Setting up AlertManager

1. Create an AlertManager configuration:

```yaml
apiVersion: monitoring.coreos.com/v1
kind: AlertmanagerConfig
metadata:
  name: main-rules
  namespace: monitoring
spec:
  route:
    receiver: 'slack'
  receivers:
  - name: 'slack'
    slackConfigs:
    - channel: '#alerts'
      apiURL: 'https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX'
```

2. Apply with:

```bash
kubectl apply -f alertmanager-config.yaml
```

3. Create alert rules:

```yaml
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: main-rules
  namespace: monitoring
  labels:
    team: frontend
spec:
  groups:
  - name: main
    rules:
    - alert: HighCPUUsage
      expr: 100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[2m])) * 100) > 80
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: High CPU usage detected
```

4. Apply with:

```bash
kubectl apply -f prometheus-rules.yaml
```

## Accessing the Dashboards

- For Prometheus:

```bash
kubectl port-forward -n monitoring svc/prometheus-operated 9090
```

Access at http://localhost:9090

- For Grafana:

```bash
kubectl port-forward -n monitoring svc/grafana 3000:3000
```

Access at http://localhost:3000

- For AlertManager:

```bash
kubectl port-forward -n monitoring svc/alertmanager-operated 9093
```

Access at http://localhost:9093

Recommended Grafana Dashboards

- Kubernetes Cluster Overview: 315
- Kubernetes Deployment Statefulset Daemonset metrics: 8588
- Kubernetes Capacity Planning: 5228
- Kubernetes Resource Requests and Limits: 10842

Remember to adjust the configuration files according to your specific needs and environment. Always follow Kubernetes best practices for production deployments, including proper resource allocation, security configurations, and high availability setups.