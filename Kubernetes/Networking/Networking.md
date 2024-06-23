# Kubernetes Networking

This guide provides step-by-step instructions for creating and managing Kubernetes networking resources, specifically Services and Network Policies.

## Table of Contents
1. [Services](#services)
   - [ClusterIP Service](#clusterip-service)
   - [NodePort Service](#nodeport-service)
   - [LoadBalancer Service](#loadbalancer-service)
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

Network Policies

Network Policies are an application-centric construct which allow you to specify how a pod is allowed to communicate with various network "entities".

1. Create a file named `network-policy.yaml`:

This Network Policy does the following:

- Applies to pods with the label role: db in the default namespace

- Allows incoming traffic from:

   - IP addresses in the range 172.17.0.0/16 (except 172.17.1.0/24)

   - Pods in namespaces with the label project: myproject

   - Pods with the label role: frontend

- Allows outgoing traffic to IP addresses in the range 10.0.0.0/24 on TCP port 5978

2. Apply the Network Policy:

```bash
kubectl apply -f network-policy.yaml
```

3. Verify the Network Policy:

```bash
kubectl get networkpolicies
kubectl describe networkpolicy test-network-policy
```
