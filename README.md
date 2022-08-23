# Pre-requisites:
- [podman](https://podman.io/getting-started/installation)
# Setup on podman
```
cd podman
./install.sh
```
OR
```bash
cd podman
podman play kube grafana-single-pod.yml
podman cp grafana.conf  grafana_ha-proxy:/etc/nginx/nginx.conf
podman cp grafana1.ini grafana_ha-grafana1:/etc/grafana/grafana.ini    
podman cp grafana2.ini grafana_ha-grafana2:/etc/grafana/grafana.ini
podman pod restart grafana_ha
```

Go to [localhost:4000](http://localhost:4000)

# Setup on kd3 | Kubernetes
- Installation guide - [https://k3d.io/v5.4.1/](https://k3d.io/v5.4.1/)
## Create a cluster
```
k3d cluster create cloud-native --api-port 6550 -p "8080:80@loadbalancer" -p "8443:443@loadbalancer" --agents 2 --servers 3
k3d cluster list
export KUBECONFIG="$(k3d kubeconfig write cloud-native)"
kubectl cluster-info
```
## Setup environment
```
cd k8s
 ./kube-setup.sh 
```
 OR
```
kubectl create namespace cloud
kubectl config set-context --current --namespace=cloud
kubectl apply -f  secrets.yml
kubectl get secrets
kubectl apply -f grafana-config.yml
kubectl apply -f postgres-deployment.yml
kubectl apply -f grafana-deployment.yml
kubectl get pods
kubectl get svc/grafana
kubectl apply -f ingress.yml 
echo  '127.0.0.1  grafana.example.com' >  /etc/hosts/
```
Go to [grafana-example.com:8080](http://grafana.example.com:8080)

## Delete cluster
```
k3d cluster delete cloud-native
```
## Decoding the passwords:
```
echo cG9zdGdyZXMxMjM= | base64 -d
echo cG9zdGdyZXM= | base64 -d
```

# Rreferences:
- https://k3d.io/v5.4.1/usage/exposing_services/
- https://kubernetes.io/docs/concepts/services-networking/service/
- https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
- https://www.redhat.com/sysadmin/podman-docker-compose
- https://github.com/nginxinc/docker-nginx/issues/422
- https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-config-file/
- https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables
- https://shocksolution.com/2018/12/14/creating-kubernetes-secrets-using-tls-ssl-as-an-example/
- https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/