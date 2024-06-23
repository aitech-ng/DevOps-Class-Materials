# Connect to Docker Desktop Kubernetes

Docker Desktop includes a standalone Kubernetes server and client, making it easy to run Kubernetes locally.

## Windows

1. Install Docker Desktop for Windows:
Download from: https://www.docker.com/products/docker-desktop

2. Enable Kubernetes:
   - Open Docker Desktop
   - Go to Settings > Kubernetes
   - Check "Enable Kubernetes"
   - Click "Apply & Restart"

3. Verify the connection:

Open PowerShell and run:
```powershell
kubectl get nodes
```


## Mac

1. Install Docker Desktop for Mac:
Download from: https://www.docker.com/products/docker-desktop

2. Enable Kubernetes:
   - Open Docker Desktop
   - Go to Settings > Kubernetes
   - Check "Enable Kubernetes"
   - Click "Apply & Restart"

3. Verify the connection:

Open Terminal and run:

```bash
kubectl get nodes
```