# Setting up ELK Stack with Filebeat on Kubernetes

This guide provides instructions for setting up the ELK (Elasticsearch, Logstash, Kibana) stack with Filebeat on Kubernetes.

## Prerequisites

- A running Kubernetes cluster
- kubectl configured to interact with your cluster
- Helm 3 installed

## Setup

1. Add the Elastic Helm repository:

```bash
helm repo add elastic https://helm.elastic.co
helm repo update
```

2. Create a namespace for the ELK stack:

```bash
kubectl create namespace elk
```

3. Install Elasticsearch:

```bash
helm install elasticsearch elastic/elasticsearch \
  --namespace elk \
  --set replicas=3 \
  --set minimumMasterNodes=2
```

4. Install Kibana:

```bash
helm install kibana elastic/kibana \
  --namespace elk \
  --set elasticsearchHosts=http://elasticsearch-master:9200
```

5. Install Logstash:

```bash
helm install logstash elastic/logstash \
  --namespace elk \
  --set logstashPipeline.logstash.conf="input { beats { port => 5044 } } output { elasticsearch { hosts => ['elasticsearch-master:9200'] index => '%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}' } }"
```

6. Install Filebeat:

```bash
helm install filebeat elastic/filebeat \
  --namespace elk \
  --set filebeatConfig.filebeat.yml="filebeat.inputs:
- type: container
  paths:
    - /var/log/containers/*.log
processors:
- add_kubernetes_metadata:
    host: ${NODE_NAME}
    matchers:
    - logs_path:
        logs_path: '/var/log/containers/'
output.logstash:
  hosts: ['logstash-logstash:5044']"
```

7. Accessing Kibana, Port-forward the Kibana service:

```bash
kubectl port-forward -n elk svc/kibana-kibana 5601:5601
```

Access Kibana at http://localhost:5601


8. Verifying the Setup, Check the status of the pods:

```bash
kubectl get pods -n elk
```

9. View logs from Filebeat:

```bash
kubectl logs -n elk -l app=filebeat-filebeat -f
```

In Kibana, create an index pattern for filebeat-* to start viewing logs.

Notes:

- Adjust resource requests and limits based on your cluster's capacity.
- For production use, configure proper storage classes and persistent volumes.
- Secure your ELK stack by implementing authentication and encryption.

