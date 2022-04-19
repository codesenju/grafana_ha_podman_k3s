# Pre-requisites:
- [podman](https://podman.io/getting-started/installation)
# Setup on podman
```
./install.sh
```
OR
```bash
podman play kube monitor.yml 
podman cp grafana.conf  monitor-grafana-proxy:/etc/nginx/nginx.conf
podman cp grafana1.ini monitor-grafana1:/etc/grafana/grafana.ini    
podman cp grafana2.ini monitor-grafana2:/etc/grafana/grafana.ini
podman pod restart monitor
```

Go to [localhost:4000](http://localhost:4000)

# Setup on kd3 | Kubernetes
- Installation guide - [https://k3d.io/v5.4.1/](https://k3d.io/v5.4.1/)
## Create a cluster
```
k3d cluster create cloud-native --api-port 6550 -p "8081:80@loadbalancer" --agents 2
k3d cluster list
export KUBECONFIG="$(k3d kubeconfig write cloud-native)"
kubectl cluster-info
```
## Setup environment
```
 ./kube-setup.sh 
```
## Delete cluster
```
k3d cluster delete cloud-native
```

# Rreferences:
- https://k3d.io/v5.4.1/usage/exposing_services/
- https://kubernetes.io/docs/concepts/services-networking/service/
- https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
- https://www.redhat.com/sysadmin/podman-docker-compose
- https://github.com/nginxinc/docker-nginx/issues/422
- https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-config-file/
- https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables