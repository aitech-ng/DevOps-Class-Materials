# Setting up Istio on Kubernetes

This guide provides steps to install and configure Istio on your Kubernetes cluster.

## Prerequisites

- A Kubernetes cluster (version 1.20 or later)
- kubectl configured to interact with your cluster
- Helm (optional, but recommended)

## Steps

1. Download Istio:

```bash
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.x.x
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y
```

Using Helm:

```bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
kubectl create namespace istio-system
helm install istio-base istio/base -n istio-system
helm install istiod istio/istiod -n istio-system --wait
```

2. Enable Istio injection for a namespace:

```bash
kubectl label namespace default istio-injection=enabled
```

3. Verify the installation:

```bash
kubectl get pods -n istio-system
```

4. Install Istio addons (optional) This installs Kiali, Jaeger, Prometheus, and Grafana.:

```bash
kubectl apply -f samples/addons
```

5. Access the Kiali dashboard:

```bash
istioctl dashboard kiali
```

