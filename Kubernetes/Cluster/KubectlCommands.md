# Essential kubectl Commands

This guide covers 20 essential kubectl commands with their flags for managing Kubernetes clusters.

Get information about cluster resources:

```bash
kubectl get pods
```
```bash
kubectl get deployment
```
```bash
kubectl get service
```
```bash
kubectl get all
```
Get information about cluster resources: (Flags: -w watch: Watches the pods startup)

```bash
kubectl get pods -w
```

Get information about cluster resources: (Flags: -o wide: Output in plain-text format with additional information)

```bash
kubectl get pods -o wide
```

```bash
kubectl get deployment -o wide
```

Get information about cluster resources: (Flags: -n namespace: Specifying the namespace)

```bash
kubectl get pods -n prodnamespace
```

Describe detailed information about a resource:

```bash
kubectl describe pod pod_name
```

Expose a resource as a new Kubernetes service: (Flags: --port: The port that the service should serve on, --type: Type of service to create)

```bash
kubectl expose deployment nginx --port=80 --type=LoadBalancer
```

Expose a pod as a service: (Flags: - --name: A name for the new service)
    
```bash
kubectl expose pod mypod --port=6379 --name=redis-service
```

Create a ClusterIP service: (Flags: --target-port: Number or name of the port to access on the pods targeted by the service)

```bash
kubectl expose deployment myapp --port=8080 --target-port=8080 --type=ClusterIP
```

Expose multiple ports:

```bash
kubectl expose deployment myapp --port=80,443 --name=myapp-service
```

Create a pod using kubectl:

```bash
kubectl run nginx --image=nginx
```

Create a pod with a specific label: (Flags: --labels: Comma separated labels to apply to the pod)

```bash
kubectl run redis --image=redis:5.0.4 --labels="app=redis"
```

Create a pod and expose it on a specific port: (Flags: --port: The port that the container should listen on)

```bash
kubectl run nginx --image=nginx --port=80
```

Create a pod with resource limits: (Flags: --requests: The minimum amount of compute resources required, --limits: The maximum amount of compute resources allowed)

```bash
kubectl run nginx --image=nginx --requests=cpu=100m,memory=128Mi --limits=cpu=500m,memory=256Mi
```

Create a resource from a file: (Flags: -f: Filename, directory, or URL to files to use to create the resource)

```bash
kubectl apply -f manifest.yaml
```

Edit a resource:

```bash
kubectl edit deployment deployment_name
```

Delete a resource: (Flags: --grace-period: Override the grace period during deletion ,--force: Immediately remove resources from API and bypass graceful deletion)

```bash
kubectl delete pod pod_name
```

```bash
kubectl delete pod pod_name --grace-period=0 --force
```

```bash
kubectl delete deployment deployment_name
```

```bash
kubectl delete service service_name
```

Delete a resource from the manifest file:

```bash
kubectl delete -f manifest.yaml
```

Get logs from a pod: (Flags: -c: Container name when there are multiple containers in a pod, -f: Follow the logs)

```bash
kubectl logs pod_name -c container_name -f
```

Execute a command in a container: (Flags: -i: Pass stdin to the container -t: Stdin is a TTY)

```bash
kubectl exec -it pod_name -- /bin/bash
```

Port forward to a pod:

```bash
kubectl port-forward pod_name 8080:80
```

Scale a deployment: (Flags: --replicas: Number of replicas to scale to)

```bash
kubectl scale deployment deployment_name --replicas=3
```

Apply a rolling update to a deployment: (Flags: --image: New image to use for the update)

```bash
kubectl rollout update deployment deployment_name --image=new_image:tag
```

Check the status of a rollout:

```bash
kubectl rollout status deployment deployment_name
```

Undo a rollout:

```bash
kubectl rollout undo deployment deployment_name
```

Create a namespace:

```bash
kubectl create namespace namespace_name
```

Set the context for a namespace:

```bash
kubectl config set-context --current --namespace=namespace_name
```

Get information about nodes: (Flags: -o yaml: Output in YAML format)

```bash
kubectl get nodes -o yaml
```

Cordon a node (mark as unschedulable):

```bash
kubectl cordon node_name
```

Drain a node (safely evict all pods): (Flags: --ignore-daemonsets: Ignore DaemonSet-managed pods)

```bash
kubectl drain node_name --ignore-daemonsets
```

Create a secret: (Flags: --from-literal: Specify a key and literal value to insert in secret)

```bash
kubectl create secret generic secret_name --from-literal=key=value
```

Label a resource:

```bash
kubectl label pods pod_name env=prod
```

Run a temporary pod for debugging: (Flags: --rm: Delete the pod after it exits --restart=Never: Do not restart the pod)

```bash
kubectl run -it --rm debug --image=busybox --restart=Never -- /bin/sh
```



