kubectl delete -f ingress.yml
kubectl delete -f nginx-deployment.yml
kubectl delete -f grafana-deployment.yml
kubectl delete -f postgres-deployment.yml
kubectl delete -f grafana-config.yml
kubectl delete -f nginx-config.yml