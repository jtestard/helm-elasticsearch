echo "Pre-requisite: create a grant for default service account of kube-system and default namespaces to have full control over all kubernetes namespaces. This is more permissions than necessary but we don't care for hack purposes"
read
helm init
helm dep build .
sleep 5
helm install --name my-release -f values.yaml .

echo "Installation started. When the installation is done, find the elastic search port by looking at the kibana node port service `kubectl get svc`,"
echo "then run the following: `cd data && deploy-data.sh $DOCKER_HOST:$ES_PORT`. This will load sample data."
