# Pre-requisites:
- [podman](https://podman.io/getting-started/installation)
# Setup
```
./install.sh
```
OR
```bash
podman play kube grafana-server-pod.yml 
podman cp grafana.conf  monitor-grafana-proxy:/etc/nginx/nginx.conf
podman cp grafana1.ini monitor-grafana1:/etc/grafana/grafana.ini    
podman cp grafana2.ini monitor-grafana2:/etc/grafana/grafana.ini
podman pod restart monitor
```

Go to [localhost:4000](http://localhost:4000)