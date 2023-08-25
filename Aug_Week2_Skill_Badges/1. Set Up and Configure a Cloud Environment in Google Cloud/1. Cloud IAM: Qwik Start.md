# Cloud IAM: Qwik Start
# Login with 1st Username* (Username 1)
### Run in the Cloud Shell

```bash
export USERNAME2=
```
---
```bash
touch sample.txt
gsutil mb gs://$DEVSHELL_PROJECT_ID
gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID
gcloud projects remove-iam-policy-binding $DEVSHELL_PROJECT_ID --member="user:$USERNAME2" --role="roles/viewer"
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member="user:$USERNAME2" --role="roles/storage.objectViewer"
```