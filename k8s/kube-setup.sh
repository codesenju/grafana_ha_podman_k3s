k3d cluster create cloud-native --api-port 6550 -p "8080:80@loadbalancer" -p "8081:81@loadbalancer" -p "8443:443@loadbalancer" --agents 2 --servers 3
k3d cluster list
export KUBECONFIG="$(k3d kubeconfig write cloud-native)"
kubectl cluster-info
kubectl create namespace cloud
kubectl config set-context --current --namespace=cloud
kubectl apply -f secrets.yml
kubectl get secrets
kubectl apply -f grafana-config.yml
kubectl apply -f postgres-deployment.yml
kubectl apply -f grafana-deployment.yml
kubectl get pods
kubectl get svc/grafana
kubectl apply -f ingress.yml
sleep 5
echo "Waiting for pods to be ready..."
sleep 12
echo "Almost done.."
sleep 8
kubectl get pods
kubectl describe ing/nginx
echo "Done!"