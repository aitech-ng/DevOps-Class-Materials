# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install RKE
curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep download_url | grep amd64 | cut -d '"' -f 4 | wget -qi -
chmod +x rke_linux-amd64
sudo mv rke_linux-amd64 /usr/local/bin/rke

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Create a file named cluster.yml in the same directory, it should carry the nodes and there ssh key connection. also test that rke can connect to the nodes without ssh asking for password

# to setup cluster, run 
rke up

# This will create a kube_config_cluster.yml file. Set it as your kubeconfig
export KUBECONFIG=$(pwd)/kube_config_cluster.yml
cp kube_config_cluster.yml ~/.kube/config

## Install Rancher
# Add the Helm chart repository
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

# Create a namespace for Rancher
kubectl create namespace cattle-system

# Install cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.11.0

# Install Rancher
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=rancher.<VM_IP>.nip.io \
  --set bootstrapPassword=admin

# Verify the installation
kubectl -n cattle-system rollout status deploy/rancher

# to access Rancher UI
Access the Rancher UI at https://rancher.<VM_IP>.nip.io

# Create a file named argocd.tf

