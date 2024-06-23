# Setting up Kind (Kubernetes in Docker) on Linux

Kind lets you run Kubernetes on your local computer. This guide will help you set it up on Linux.

## Prerequisites

- Docker installed

## Installation Steps

1. Install Kind:
   
```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

2. Verify the installation:

```bash
kind version
```

3. Create a cluster:

```bash
kind create cluster
```

4. To use a custom configuration, create a YAML file (e.g., config.yaml):

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
```

5. Then create the cluster with:

```bash
kind create cluster --config config.yaml
```

6. Interact with your cluster:

```bash
kubectl cluster-info --context kind-kind
```

7. Delete the cluster when you're done:

```bash
kind delete cluster
```