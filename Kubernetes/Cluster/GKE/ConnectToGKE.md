# Connect to Google Kubernetes Engine (GKE)

## Prerequisites
- Google Cloud SDK installed
- `kubectl` installed

## Windows

1. Install Google Cloud SDK:
   Download and run the installer from: https://cloud.google.com/sdk/docs/install#windows

2. Open PowerShell and authenticate:
   ```powershell
   gcloud auth login

3. Set the project:

```powershell
gcloud config set project YOUR_PROJECT_ID   
```

4. Connect to your GKE cluster:

```powershell
gcloud container clusters get-credentials CLUSTER_NAME --zone ZONE_NAME --project PROJECT_ID
```
After connecting, you can use kubectl to interact with your GKE cluster.

```powershell
kubectl get nodes
```

## Mac

1. Install Google Cloud SDK:

```bash
brew install --cask google-cloud-sdk
```

2. Open Terminal and authenticate:

```bash
gcloud auth login
```

3. Set the project:

```bash
gcloud config set project YOUR_PROJECT_ID
```

4. Connect to your GKE cluster:

```bash
gcloud container clusters get-credentials CLUSTER_NAME --zone ZONE_NAME --project PROJECT_ID
```

After connecting, you can use kubectl to interact with your GKE cluster.

```bash
kubectl get nodes
```


## Linux

1. Install Google Cloud SDK:

```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

2. Authenticate:

```bash
gcloud auth login
```

3. Set the project:

```bash
gcloud config set project YOUR_PROJECT_ID
```

4. Connect to your GKE cluster:

```bash
gcloud container clusters get-credentials CLUSTER_NAME --zone ZONE_NAME --project PROJECT_ID
```

After connecting, you can use kubectl to interact with your GKE cluster.

```bash
kubectl get nodes
```