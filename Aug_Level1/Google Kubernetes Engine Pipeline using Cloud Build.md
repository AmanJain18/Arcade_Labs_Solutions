# Google Kubernetes Engine Pipeline using Cloud Build
## Run in the Cloud Shell...
```bash
export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION=us-central1
gcloud config set compute/region $REGION
git config --global user.email "you@example.com"  
git config --global user.name "Your Name"
```
---
```bash
gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com \
    containeranalysis.googleapis.com
gcloud artifacts repositories create my-repository \
  --repository-format=docker \
  --location=$REGION
gcloud container clusters create hello-cloudbuild --num-nodes 1 --region $REGION
```
## `Note:` The Above command will take 5-10 minutes to execute. Make sure your Laptop/PC doesn"t go to `SLEEP.`
---
```bash
gcloud source repos create hello-cloudbuild-app
gcloud source repos create hello-cloudbuild-env
cd ~
git clone https://github.com/GoogleCloudPlatform/gke-gitops-tutorial-cloudbuild hello-cloudbuild-app
cd ~/hello-cloudbuild-app
git remote add google "https://source.developers.google.com/p/${PROJECT_ID}/r/hello-cloudbuild-app"

COMMIT_ID="$(git rev-parse --short=7 HEAD)"
gcloud builds submit --tag="${REGION}-docker.pkg.dev/${PROJECT_ID}/my-repository/hello-cloudbuild:${COMMIT_ID}" .
```
---
```bash
gcloud beta builds triggers create cloud-source-repositories \
  --name="hello-cloudbuild" \
  --repo="hello-cloudbuild-app" \
  --branch-pattern=".*" \
  --build-config="cloudbuild.yaml"
git push google master
```
---
```bash
PROJECT_NUMBER="$(gcloud projects describe ${PROJECT_ID} --format='get(projectNumber)')"
gcloud projects add-iam-policy-binding ${PROJECT_NUMBER} \
--member=serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
--role=roles/container.developer
cd ~
gcloud source repos clone hello-cloudbuild-env
cd ~/hello-cloudbuild-env
git checkout -b production

PROJECT_NUMBER="$(gcloud projects describe ${PROJECT_ID} \
--format='get(projectNumber)')"
cat >/tmp/hello-cloudbuild-env-policy.yaml <<EOF
bindings:
- members:
  - serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com
  role: roles/source.writer
EOF

gcloud source repos set-iam-policy \
hello-cloudbuild-env /tmp/hello-cloudbuild-env-policy.yaml
gcloud beta builds triggers create cloud-source-repositories \
  --name="hello-cloudbuild-deploy" \
  --repo="hello-cloudbuild-env" \
  --branch-pattern="^candidate$" \
  --build-config="cloudbuild.yaml"
cp cloudbuild-trigger-cd.yaml cloudbuild.yaml
git add cloudbuild.yaml
git commit -m "Trigger CD pipeline"
git push google master
```
