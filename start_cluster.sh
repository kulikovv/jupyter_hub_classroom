wget https://storage.googleapis.com/kubernetes-helm/helm-v2.6.2-linux-amd64.tar.gz
tar zxfv helm-v2.6.2-linux-amd64.tar.gz
cp linux-amd64/helm .

gcloud container clusters create cluster-1 \
    --num-nodes 2 --enable-autoscaling --min-nodes 1 --max-nodes 30 \
    --machine-type=n1-standard-1 \
    --zone=us-central1-b

kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:default concourse-admin
./helm init --service-account tiller
sleep 30s
./helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
./helm repo update
sleep 30s
./helm install jupyterhub/jupyterhub \
 --version=v0.6 \
 --name=jupyterhub-class \
 --namespace=jupyterhub-class \
 -f config.yaml\
 --timeout=700
