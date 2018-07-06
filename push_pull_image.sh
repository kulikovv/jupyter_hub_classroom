docker pull kulikovv/torchhub
GCP_PROJECT="$(gcloud config list 2> /dev/null | grep project | awk -F" = " '{print $2}')"
echo ${GCP_PROJECT}
docker tag kulikovv/torchhub gcr.io/${GCP_PROJECT}/class-notebook
gcloud docker -- push "gcr.io/${GCP_PROJECT}/class-notebook"
