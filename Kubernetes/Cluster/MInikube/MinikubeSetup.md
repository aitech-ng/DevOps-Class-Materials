# Setup Minikube on Linux, Windows or Mac

## LINUX (CLI)

### Install Docker

```bash
sudo apt install docker.io -y

# Download and Install Minikube Binary

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Install Kubectl tool

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Start minikube

minikube start --driver=docker
```

## WINDOWS (GUI)

 Get the installer from here: https://storage.googleapis.com/minikube/releases/latest/minikube-installer.exe

## MAC (CLI)

### Install with Homebrew

brew install minikube