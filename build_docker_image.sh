GCP_PROJECT="$(gcloud config list 2> /dev/null | grep project | awk -F" = " '{print $2}')"
echo ${GCP_PROJECT}
IMAGE_ID=$(docker build -q -t gcr.io/${GCP_PROJECT}/class-notebook ./Pytorch_Jupyterhub 2>/dev/null | awk '/Successfully built/{print $NF}')
echo ${IMAGE_ID}
gcloud docker -- push "gcr.io/${GCP_PROJECT}/class-notebook"
