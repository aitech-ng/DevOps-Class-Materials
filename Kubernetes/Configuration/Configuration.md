# Kubernetes Configuration

This document outlines various configuration options in Kubernetes, including Secrets and ConfigMaps.

## Secrets

Secrets are used to store sensitive information, such as passwords, OAuth tokens, and ssh keys.

### Example Secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: example-secret
type: Opaque
data:
  user: YWRtaW4=      # Base64 encoded "admin"
  password: MTIzNDU=  # Base64 encoded "12345"
  database: Y29tcHV0ZXg=  # Base64 encoded "computex"
```
Command to encode in base64

```bash
echo -n 'admin' | base64
```

1. To create this secret:

```bash
kubectl apply -f secret.yml
```

2. To use this secret in a pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-example-pod
spec:
  containers:
  - name: postgres-container
    image: postgres
    env:
    - name: SECRET_USERNAME
      valueFrom:
        secretKeyRef:
          name: example-secret
          key: user
    - name: SECRET_PASSWORD
      valueFrom:
        secretKeyRef:
          name: example-secret
          key: password
```

## ConfigMaps

ConfigMaps allow you to decouple configuration artifacts from image content to keep containerized applications portable.

### Example ConfigMap

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config-map
data:
  database_host: "mysql.example.com"
  database_port: "3306"
  app_config.properties: |
    app.name=MyApp
    app.version=1.0.0
    log.level=INFO
```    

1. To create this ConfigMap:

```bash
kubectl apply -f configmap.yml
```

2. To use this ConfigMap in a pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configmap-example-pod
spec:
  containers:
  - name: example-container
    image: nginx
    env:
    - name: DATABASE_HOST
      valueFrom:
        configMapKeyRef:
          name: my-config-map
          key: database_host
    - name: DATABASE_PORT
      valueFrom:
        configMapKeyRef:
          name: my-config-map
          key: database_port
    volumeMounts:
    - name: config
      mountPath: "/config"
      readOnly: true
  volumes:
  - name: config
    configMap:
      name: my-config-map
      items:
      - key: "app_config.properties"
        path: "app_config.properties"
```

This configuration demonstrates how to use both Secrets and ConfigMaps in Kubernetes, providing examples of how to create them and use them in pods.