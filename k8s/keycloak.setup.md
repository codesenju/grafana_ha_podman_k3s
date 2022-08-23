##
```
k3d cluster create cloud-native --api-port 6550 -p "8080:80@loadbalancer" -p "8081:81@loadbalancer" -p "8443:443@loadbalancer" --agents 2 --servers 3
k3d cluster list
export KUBECONFIG="$(k3d kubeconfig write cloud-native)"
kubectl cluster-info
kubectl create namespace cloud
kubectl config set-context --current --namespace=cloud
```
```bash
helm repo add codecentric https://codecentric.github.io/helm-charts
```
```bash
helm install my-keycloak codecentric/keycloak --version 18.1.0
```
```
kubectl port-forward svc/my-keycloak-http 8888:80
```
```
kubectl apply -f ingress.yml
```