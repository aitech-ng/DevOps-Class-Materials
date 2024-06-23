# Setting up an Ingress with Nginx Ingress Controller on Minikube

This guide explains how to set up an Ingress controller using NGINX in Minikube.

1. Start Minikube:

```bash
minikube start --driver=docker
```

2. Enable the Ingress Addon for Minikube:

```bash
minikube addons enable ingress
```

3. Install the NGINX Ingress Controller:

Using Helm:
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx
```

Using kubectl:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml
```

4. Map the Minikube IP to the domain name in the Ingress:

```bash
echo "$(minikube ip) app.victor.com" | sudo tee -a /etc/hosts
```

5. Apply the Ingress Resource:

```bash
kubectl apply -f ingress-minikube.yml
```