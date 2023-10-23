# Exploring IAM.

### Run in the Cloud Shell...
```bash
export USERNAME2=
```
```bash
gsutil mb gs://$DEVSHELL_PROJECT_ID
curl -L -o sample.txt https://raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/oct/Oct_Trivia_W3/sample.txt
gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID
gcloud projects remove-iam-policy-binding $DEVSHELL_PROJECT_ID --member=user:$USERNAME2 --role=roles/viewer
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member=user:$USERNAME2 --role=roles/storage.objectViewer
gcloud iam service-accounts create read-bucket-objects --display-name="Read Bucket Objects Service Account"
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member=serviceAccount:read-bucket-objects@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --role=roles/storage.objectViewer
  gcloud iam service-accounts add-iam-policy-binding read-bucket-objects@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com \
  --member=domain:altostrat.com \
  --role=roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member=domain:altostrat.com --role=roles/compute.instanceAdmin.v1
gcloud compute instances create demoiam \
  --zone us-central1-a \
  --machine-type e2-micro \
  --image-family debian-11 \
  --image-project debian-cloud \
  --boot-disk-size 10GB \
  --service-account read-bucket-objects@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com
```