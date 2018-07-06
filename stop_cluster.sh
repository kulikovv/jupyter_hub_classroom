./helm delete jupyterhub-class --purge
kubectl delete namespace jupyterhub-class
gcloud container clusters delete cluster-1 --zone=us-central1-b --quiet
