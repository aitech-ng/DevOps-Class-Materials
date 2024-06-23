# Installing kubectl on Windows, Mac, and Linux

kubectl is the command-line tool for interacting with Kubernetes clusters.

## Windows

1. Download the latest release:

```powershell
curl -LO "https://dl.k8s.io/release/v1.28.0/bin/windows/amd64/kubectl.exe"
```

2. Add kubectl to your Environment Variable PATH.

3. Verify the installation:

```powershell
kubectl version --client
```

## Mac

1. Using Homebrew:

```bash
brew install kubectl
```

Or download the binary:

```bash
curl -LO "https://dl.k8s.io/release/v1.28.0/bin/darwin/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

2. Verify the installation:

```bash
kubectl version --client
```

## Linux

1. Download kubectl:

```bash
curl -LO "https://dl.k8s.io/release/v1.28.0/bin/linux/amd64/kubectl"
```

2. Install kubectl:

```bash
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

3. Verify the installation:

```bash
kubectl version --client
```

kubectl is now installed and ready to use!
