echo "*************** Delete following deployments ***********" 
kubectl get deployments | grep kube-prometheus
echo " ****OK to GO Aheadr? *****"
read x
kubectl delete deployment `kubectl get deployments | grep kube-prometheus | awk '{print $1}'`

echo "************ Proceed to delete StatefulSet? ************"
kubectl get statefulset | grep kube-prometheu
read x
kubectl delete statefulset `kubectl get statefulset | grep kube-prometheus | awk '{print $1}'`

echo "************ Proceed to delete DaemonSet ? ************"
kubectl get  statefulset
read x
kubectl delete statefulset `kubectl get statefulset | grep kube-prometheus | awk '{print $1}'`




