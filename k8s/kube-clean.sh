kubectl config set-context --current --namespace=cloud
kubectl delete -f ingress.yml
kubectl delete -f grafana-deployment.yml
kubectl delete -f postgres-deployment.yml
kubectl delete -f grafana-config.yml
kubectl delete -f secrets.yml
kubectl get all
sleep 2
k3d cluster delete cloud-native