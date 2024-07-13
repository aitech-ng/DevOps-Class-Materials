from kubernetes import client, config
from kubernetes.client import ApiException
import subprocess
import os
from datetime import datetime

# Load Kubernetes configuration
config.load_kube_config()

# Create API clients
v1 = client.CoreV1Api()
apps_v1 = client.AppsV1Api()
custom_objects = client.CustomObjectsApi()

def scale_deployment(name, namespace, replicas):
    try:
        apps_v1.patch_namespaced_deployment_scale(
            name=name,
            namespace=namespace,
            body={"spec": {"replicas": replicas}}
        )
        print(f"Scaled deployment {name} in namespace {namespace} to {replicas} replicas")
    except ApiException as e:
        print(f"Exception when scaling deployment: {e}")

def get_hpa_metrics(name, namespace):
    try:
        hpa = custom_objects.get_namespaced_custom_object(
            group="autoscaling",
            version="v2beta1",
            namespace=namespace,
            plural="horizontalpodautoscalers",
            name=name
        )
        return hpa['status']['currentMetrics']
    except ApiException as e:
        print(f"Exception when getting HPA metrics: {e}")
        return None

if __name__ == "__main__":
    # Backup etcd
    backup_etcd()
    
    # Example: Scale a deployment based on CPU usage
    deployment_name = "your-deployment"
    namespace = "your-namespace"
    hpa_name = "your-hpa"
    
    metrics = get_hpa_metrics(hpa_name, namespace)
    if metrics:
        for metric in metrics:
            if metric['type'] == 'Resource' and metric['resource']['name'] == 'cpu':
                current_cpu = metric['resource']['current']['averageUtilization']
                if current_cpu > 80:
                    scale_deployment(deployment_name, namespace, 5)  # Scale up to 5 replicas
                elif current_cpu < 20:
                    scale_deployment(deployment_name, namespace, 2)  # Scale down to 2 replicas
    
    print("Kubernetes management tasks completed.")