# Kubernetes Engine: Qwik Start.

### Run in the Cloud Shell...
```bash
export ZONE=
```
```bash
export REGION=${ZONE::-2}
gcloud config set compute/region $REGION
gcloud config set compute/zone $ZONE
gcloud container clusters create lab-cluster --machine-type=e2-medium --zone=$ZONE
gcloud container clusters get-credentials lab-cluster
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment hello-server --type=LoadBalancer --port 8080
```
### Check the progress of `Task 2` and both the progress of `Task 4`
```bash
gcloud container clusters delete lab-cluster
```
### Now, Check the Progress of `task 5.`