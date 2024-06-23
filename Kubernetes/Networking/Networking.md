# Kubernetes Networking

This guide provides step-by-step instructions for creating and managing Kubernetes networking resources, specifically Services and Network Policies.

## Table of Contents
1. [Services](#services)
   - [ClusterIP Service](#clusterip-service)
   - [NodePort Service](#nodeport-service)
   - [LoadBalancer Service](#loadbalancer-service)
   - [ExternalName Service](#externalname-service)
2. [Network Policies](#network-policies)

Services

Services in Kubernetes are an abstraction which defines a logical set of Pods and a policy by which to access them.

ClusterIP Service

ClusterIP exposes the service on a cluster-internal IP.

1. Create a file named `clusterip-service.yaml`:

2. Apply the Service:

```bash
kubectl apply -f clusterip-service.yaml
```

3. Verify the Service:

```bash
kubectl get services
```

NodePort Service

NodePort exposes the service on each Node's IP at a static port.

1. Create a file named `nodeport-service.yaml`:

2. Apply the Service:

```bash
kubectl apply -f nodeport-service.yaml
```

3. Verify the Service:

```bash
kubectl get services
```

LoadBalancer Service

LoadBalancer exposes the service externally using a cloud provider's load balancer.

1. Create a file named `loadbalancer-service.yaml`:

2. Apply the Service:

```bash
kubectl apply -f loadbalancer-service.yaml
```

3. Verify the Service:

```bash
kubectl get services
```
