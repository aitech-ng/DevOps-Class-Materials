# RBAC in Kubernetes

Role-Based Access Control (RBAC) in Kubernetes allows you to control access to resources within your cluster.

## Steps to Set Up RBAC

1. Create a Role or ClusterRole

2. Create a RoleBinding or ClusterRoleBinding

3. Apply the RBAC resources

```bash
kubectl apply -f role.yml
kubectl apply -f rolebinding.yml
```