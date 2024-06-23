# Connect to Azure Kubernetes Service (AKS)

## Prerequisites
- Azure CLI installed
- `kubectl` installed

## Windows

1. Install Azure CLI:
   Download and run the installer from: https://aka.ms/installazurecliwindows

2. Open PowerShell and log in to Azure:

```powershell
az login
```

3. Set the subscription:

```powershell
az account set --subscription YOUR_SUBSCRIPTION_ID
```

4. Connect to your AKS cluster:

```powershell
az aks get-credentials --resource-group YOUR_RESOURCE_GROUP --name YOUR_AKS_CLUSTER_NAME
```

After connecting, you can use kubectl to interact with your AKS cluster.

```powershell
kubectl get nodes
```

## Mac

1. Install Azure CLI:

```bash
brew update && brew install azure-cli
```

2. Open Terminal and log in to Azure:

```bash
az login
```

3. Set the subscription:

```bash
az account set --subscription YOUR_SUBSCRIPTION_ID
```

4. Connect to your AKS cluster:

```bash
az aks get-credentials --resource-group YOUR_RESOURCE_GROUP --name YOUR_AKS_CLUSTER_NAME
```

After connecting, you can use kubectl to interact with your AKS cluster.

```bash
kubectl get nodes
```

## Linux

1. Install Azure CLI:

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

2. Log in to Azure:

```bash
az login
```

3. Set the subscription:

```bash
az account set --subscription YOUR_SUBSCRIPTION_ID
```

4. Connect to your AKS cluster:

```bash
az aks get-credentials --resource-group YOUR_RESOURCE_GROUP --name YOUR_AKS_CLUSTER_NAME
```

After connecting, you can use kubectl to interact with your AKS cluster.

```bash
kubectl get nodes
```