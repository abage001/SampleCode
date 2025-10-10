cd  ./operater/deployment
kubectl apply -f deployment-exporter.yaml	
sleep 5
kubectl apply -f deployment-metrics.yaml		
sleep 5
kubectl apply -f deployment-operator.yaml
sleep 5
cd - 
exit 0
#./operater/statefulsets:
kubectl apply -f statefulsets-kube-prometheus.yaml	
kubectl apply -f statefulsets-kube-alertmanager.yaml

# ./statefulsets:
kubectl apply -f statefulsets-alert-manager.yaml

# ./operater/daemonsets:
kubectl apply -f daemonsets-node-exporter.yaml

# ./deployment:
kubectl apply -f deployment.yaml
