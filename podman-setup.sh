podman volume rm -f db-data-claim
podman play kube --down grafana-single-pod.yml
echo "Creating new pod 'grafana_ha'..."
podman play kube grafana-single-pod.yml 
echo "Copying configuration files..."
podman cp ./nginx/conf/nginx.conf  grafana_ha-proxy:/etc/nginx/nginx.conf
podman cp ./grafana/conf/grafana1.ini grafana_ha-grafana1:/etc/grafana/grafana.ini    
podman cp ./grafana/conf/grafana2.ini grafana_ha-grafana2:/etc/grafana/grafana.ini
echo "Restarting pod... "
podman pod restart grafana_ha
sleep 8
podman restart grafana_ha-grafana1
podman restart grafana_ha-grafana2
podman restart grafana_ha-proxy
sleep 2
podman ps
echo "Done!"