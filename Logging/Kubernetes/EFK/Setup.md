# Setting up EFK Stack (Elasticsearch, Fluentd, Kibana) on Kubernetes

This guide provides instructions for setting up the EFK stack on Kubernetes.

## Prerequisites

- A running Kubernetes cluster
- kubectl configured to interact with your cluster
- Helm 3 installed

## Setup

1. Add the Elastic and Bitnami Helm repositories:

```bash
helm repo add elastic https://helm.elastic.co
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

2. Create a namespace for the EFK stack:

```bash
kubectl create namespace efk
```

3. Install Elasticsearch:

```bash
helm install elasticsearch elastic/elasticsearch \
  --namespace efk \
  --set replicas=3 \
  --set minimumMasterNodes=2
```

4. Install Kibana:

```bash
helm install kibana elastic/kibana \
  --namespace efk \
  --set elasticsearchHosts=http://elasticsearch-master:9200
```

5. Install Fluentd:

```bash
helm install fluentd bitnami/fluentd \
  --namespace efk \
  --set forwarder.configMap=fluentd-forwarder-cm \
  --set aggregator.configMap=fluentd-aggregator-cm
```

6. Create ConfigMaps for Fluentd, Create a file named fluentd-forwarder-cm.yaml:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: fluentd-forwarder-cm
  namespace: efk
data:
  fluentd.conf: |
    <source>
      @type tail
      path /var/log/containers/*.log
      pos_file /var/log/fluentd-containers.log.pos
      tag kubernetes.*
      read_from_head true
      <parse>
        @type json
        time_format %Y-%m-%dT%H:%M:%S.%NZ
      </parse>
    </source>

    <match kubernetes.**>
      @type forward
      send_timeout 60s
      recover_wait 10s
      hard_timeout 60s
      <server>
        name fluentd-aggregator
        host fluentd-aggregator
        port 24224
      </server>
    </match>
```

7. Create a file named fluentd-aggregator-cm.yaml:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: fluentd-aggregator-cm
  namespace: efk
data:
  fluentd.conf: |
    <source>
      @type forward
      port 24224
      bind 0.0.0.0
    </source>

    <match **>
      @type elasticsearch
      host elasticsearch-master
      port 9200
      logstash_format true
      logstash_prefix fluentd
      include_tag_key true
      type_name fluentd
      tag_key @log_name
      flush_interval 1s
    </match>
```

8. Apply the ConfigMaps:

```bash
kubectl apply -f fluentd-forwarder-cm.yaml
kubectl apply -f fluentd-aggregator-cm.yaml
```

9. Accessing Kibana, Port-forward the Kibana service:

```bash
kubectl port-forward -n efk svc/kibana-kibana 5601:5601
```

10. Access Kibana at http://localhost:5601

11. Verifying the Setup, Check the status of the pods:

```bash
kubectl get pods -n efk
```

12. View logs from Fluentd:

```bash
kubectl logs -n efk -l app.kubernetes.io/name=fluentd -f
```

In Kibana, create an index pattern for fluentd-* to start viewing logs.

Notes:

- Adjust resource requests and limits based on your cluster's capacity.
- For production use, configure proper storage classes and persistent volumes.
- Secure your EFK stack by implementing authentication and encryption.
- Consider tuning Fluentd configuration for optimal performance and log parsing.