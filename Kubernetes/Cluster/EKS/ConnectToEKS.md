# Connect to Amazon Elastic Kubernetes Service (EKS)

## Prerequisites
- AWS CLI installed
- `kubectl` installed
- `aws-iam-authenticator` installed

## Windows

1. Install AWS CLI:

Download and run the installer from: https://awscli.amazonaws.com/AWSCLIV2.msi


2. Install aws-iam-authenticator:

Download from: https://github.com/kubernetes-sigs/aws-iam-authenticator/releases
Add the executable to your PATH.

3. Open PowerShell and configure AWS CLI:

```powershell
aws configure
```

4. Update your kubeconfig:

```powershell
aws eks get-token --cluster-name YOUR_CLUSTER_NAME | kubectl apply -f -
```

After connecting, you can use kubectl to interact with your EKS cluster.

```powershell
kubectl get nodes
```

## Mac

1. Install AWS CLI and aws-iam-authenticator:

```bash
brew install awscli aws-iam-authenticator
```

2. Open Terminal and configure AWS CLI:

```bash
aws configure
```

3. Update your kubeconfig:

```bash
aws eks get-token --cluster-name YOUR_CLUSTER_NAME | kubectl apply -f -
```

After connecting, you can use kubectl to interact with your EKS cluster.

```bash
kubectl get nodes
```

## Linux

1. Install AWS CLI:

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

2. Install aws-iam-authenticator:

```bash
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv ./aws-iam-authenticator /usr/local/bin/
```

3. Configure AWS CLI:

```bash
aws configure
```

4. Update your kubeconfig:

```bash
aws eks get-token --cluster-name YOUR_CLUSTER_NAME | kubectl apply -f -
```

After connecting, you can use kubectl to interact with your EKS cluster.

```bash
kubectl get nodes
```