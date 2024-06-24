# RBAC in Kubernetes

Role-Based Access Control (RBAC) in Kubernetes allows you to control access to resources within your cluster.

## Creating a User in Kubernetes

1. Generate a private key:

```bash
openssl genrsa -out user.key 2048
```

2. Create a certificate signing request (CSR):

```bash
openssl req -new -key user.key -out user.csr -subj "/CN=user/O=group"
```

3. Sign the CSR with your Kubernetes CA:

```bash
openssl x509 -req -in user.csr -CA /path/to/kubernetes/ca.crt -CAkey /path/to/kubernetes/ca.key -CAcreateserial -out user.crt -days 500
```

4. Add the user to kubeconfig:

```bash
kubectl config set-credentials user --client-certificate=user.crt --client-key=user.key
kubectl config set-context user-context --cluster=your-cluster --user=user
```

## Steps to Set Up RBAC

### Roles and Role Binding

1. Create a Role resource 'role.yml':

2. Create a RoleBinding resource 'rolebinding.yml':

3. Apply the RBAC resources:

```bash
kubectl apply -f role.yml
kubectl apply -f rolebinding.yml
```

### Service Accounts, ClusterRoles, and ClusterRole Binding

1. Create a ServiceAccount Resource 'serviceaccount.yml':

2. Create a ClusterRole Resource 'clusterrole.yml':

3. Create a ClusterRoleBinding Resource 'clusterrolebinding.yml':

4. Apply the RBAC resources:

```bash
kubectl apply -f serviceaccount.yml
kubectl apply -f clusterrole.yml
kubectl apply -f clusterrolebinding.yml
```