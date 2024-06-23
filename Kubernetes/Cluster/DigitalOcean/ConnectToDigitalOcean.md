# Connect to DigitalOcean Kubernetes

## Prerequisites
- `doctl` (DigitalOcean CLI) installed
- `kubectl` installed

## Windows

1. Install doctl:

Download from: https://github.com/digitalocean/doctl/releases

Add the executable to your Environment Variable PATH.

2. Open PowerShell and authenticate:

```powershell
doctl auth init
```

3. Get the cluster ID:

```powershell
doctl kubernetes cluster list
```

4. Connect to your cluster:

```powershell
doctl kubernetes cluster kubeconfig save CLUSTER_ID
```

After connecting, you can use kubectl to interact with your DigitalOcean Kubernetes cluster.

```powershell
kubectl get nodes
```

## Mac

1. Install doctl:

```bash
brew install doctl
```

2. Open Terminal and authenticate:

```bash
doctl auth init
```

3. Get the cluster ID:

```bash
doctl kubernetes cluster list
```

4. Connect to your cluster:

```bash
doctl kubernetes cluster kubeconfig save CLUSTER_ID
```

After connecting, you can use kubectl to interact with your DigitalOcean Kubernetes cluster.

```bash
kubectl get nodes
```

## Linux

1. Install doctl:

```bash
wget https://github.com/digitalocean/doctl/releases/download/v1.XX.X/doctl-1.XX.X-linux-amd64.tar.gz
tar xf ~/doctl-1.XX.X-linux-amd64.tar.gz
sudo mv ~/doctl /usr/local/bin
```

2. Authenticate:

```bash
doctl auth init
```

3. Get the cluster ID:

```bash
doctl kubernetes cluster list
```

4. Connect to your cluster:

```bash
doctl kubernetes cluster kubeconfig save CLUSTER_ID
```

After connecting, you can use kubectl to interact with your DigitalOcean Kubernetes cluster.

```bash
kubectl get nodes
```
