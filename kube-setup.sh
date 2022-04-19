kubectl apply -f grafana-config.yml
kubectl apply -f nginx-config.yml
echo "Gettig config files ready..."
sleep 2
kubectl get configmaps
# kubectl describe configmaps/grafana-config
# kubectl describe configmaps/grafana-proxy-config
echo "Creating deployemnts - postgres-deployment, grafana-deployment.yml, nginx-deployment.yml..."
kubectl apply -f postgres-deployment.yml
kubectl apply -f grafana-deployment.yml
kubectl apply -f nginx-deployment.yml
echo "Waiting for deployments to be ready..."
sleep 10
kubectl rollout restart deploy/grafana-deployment
sleep 2
echo "Almost ready..."
kubectl apply -f ingress.yml
sleep 4
kubectl get ingress/nginx
echo "Almost done.."
sleep 15
kubectl get pods
echo "Done!"