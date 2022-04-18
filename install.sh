podman pod rm -f monitor
echo "Creating new pod 'monitor'..."
podman play kube monitor.yml 
echo "Copying configuration files..."
podman cp grafana.conf  monitor-grafana-proxy:/etc/nginx/nginx.conf
podman cp grafana1.ini monitor-grafana1:/etc/grafana/grafana.ini    
podman cp grafana2.ini monitor-grafana2:/etc/grafana/grafana.ini
echo "Restarting pod... "
podman pod restart monitor
sleep 8
podman restart monitor-grafana1
podman restart monitor-grafana2
podman restart monitor-grafana-proxy
sleep 2
podman ps
echo "Done!"