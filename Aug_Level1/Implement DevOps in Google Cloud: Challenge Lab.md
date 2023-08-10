# Implement DevOps in Google Cloud: Challenge Lab.

## Run in the Cloud Shell...

```bash
export EMAIL=
```
### Copy username and paste it in below command after =
---
```bash
export CLUSTER_NAME=hello-cluster
export ZONE=us-central1-b
export REGION=us-central1
export REPO=my-repository
export PROJECT_ID=$(gcloud config get-value project)
gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com
gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
--format="value(projectNumber)")@cloudbuild.gserviceaccount.com --role="roles/container.developer"
git config --global user.email $EMAIL 
git config --global user.name student
gcloud artifacts repositories create $REPO \
    --repository-format=docker \
    --location=$REGION \
    --description="Subscribe to quicklab"
gcloud beta container --project "$PROJECT_ID" clusters create "$CLUSTER_NAME" --zone "$ZONE" --no-enable-basic-auth --cluster-version latest --release-channel "regular" --machine-type "e2-medium" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true  --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/$PROJECT_ID/global/networks/default" --subnetwork "projects/$PROJECT_ID/regions/$REGION/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --enable-autoscaling --min-nodes "2" --max-nodes "6" --location-policy "BALANCED" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-shielded-nodes --node-locations "$ZONE"
kubectl create namespace prod	
kubectl create namespace dev
gcloud source repos create sample-app
git clone https://source.developers.google.com/p/$PROJECT_ID/r/sample-app
cd ~
gsutil cp -r gs://spls/gsp330/sample-app/* sample-app
git init
cd sample-app/
git add .
git commit -m "Subscribe to quicklab" 
git push -u origin master
git branch dev
git checkout dev
git push -u origin dev
gcloud builds triggers create cloud-source-repositories --name="sample-app-prod-deploy" --repo="sample-app" --branch-pattern="^master$" --build-config="cloudbuild.yaml"
gcloud builds triggers create cloud-source-repositories --name="sample-app-dev-deploy" --repo="sample-app" --branch-pattern="^dev$" --build-config="cloudbuild-dev.yaml"
COMMIT_ID="$(git rev-parse --short=7 HEAD)"
gcloud builds submit --tag="${REGION}-docker.pkg.dev/${PROJECT_ID}/$REPO/hello-cloudbuild:${COMMIT_ID}" .
IMAGE=$(gcloud builds list --format="value(IMAGES)")
sed -i "s/<version>/v1.0/g" cloudbuild-dev.yaml
sed -i "s#<todo>#$IMAGE#g" dev/deployment.yaml
git add .
git commit -m "Subscribe to quicklab" 
git push -u origin dev
git checkout master
sed -i "s/<version>/v1.0/g" cloudbuild.yaml
sed -i "s#<todo>#$IMAGE#g" prod/deployment.yaml
git add .
git commit -m "Subscribe to quicklab" 
git push -u origin master

git checkout dev

rm -rf main.go
touch main.go
tee main.go <<EOF
/**
 * Copyright 2023 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package main

import (
	"image"
	"image/color"
	"image/draw"
	"image/png"
	"net/http"
)

func main() {
	http.HandleFunc("/blue", blueHandler)
	http.HandleFunc("/red", redHandler)
	http.ListenAndServe(":8080", nil)
}

func blueHandler(w http.ResponseWriter, r *http.Request) {
	img := image.NewRGBA(image.Rect(0, 0, 100, 100))
	draw.Draw(img, img.Bounds(), &image.Uniform{color.RGBA{0, 0, 255, 255}}, image.ZP, draw.Src)
	w.Header().Set("Content-Type", "image/png")
	png.Encode(w, img)
}

func redHandler(w http.ResponseWriter, r *http.Request) {
	img := image.NewRGBA(image.Rect(0, 0, 100, 100))
	draw.Draw(img, img.Bounds(), &image.Uniform{color.RGBA{255, 0, 0, 255}}, image.ZP, draw.Src)
	w.Header().Set("Content-Type", "image/png")
	png.Encode(w, img)
}
EOF

sed -i "s/v1.0/v2.0/g" cloudbuild-dev.yaml
IMAGE2=${IMAGE::-7}v1.0
echo $IMAGE2
sed -i "s#$IMAGE#$IMAGE2#g" dev/deployment.yaml
git add .
git commit -m "Subscribe to quicklab" 
git push -u origin dev
git checkout master

rm -rf main.go
touch main.go
tee main.go <<EOF
/**
 * Copyright 2023 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package main

import (
	"image"
	"image/color"
	"image/draw"
	"image/png"
	"net/http"
)

func main() {
	http.HandleFunc("/blue", blueHandler)
	http.HandleFunc("/red", redHandler)
	http.ListenAndServe(":8080", nil)
}

func blueHandler(w http.ResponseWriter, r *http.Request) {
	img := image.NewRGBA(image.Rect(0, 0, 100, 100))
	draw.Draw(img, img.Bounds(), &image.Uniform{color.RGBA{0, 0, 255, 255}}, image.ZP, draw.Src)
	w.Header().Set("Content-Type", "image/png")
	png.Encode(w, img)
}

func redHandler(w http.ResponseWriter, r *http.Request) {
	img := image.NewRGBA(image.Rect(0, 0, 100, 100))
	draw.Draw(img, img.Bounds(), &image.Uniform{color.RGBA{255, 0, 0, 255}}, image.ZP, draw.Src)
	w.Header().Set("Content-Type", "image/png")
	png.Encode(w, img)
}
EOF
sed -i "s/v1.0/v2.0/g" cloudbuild.yaml
sed -i "s#$IMAGE#$IMAGE2#g" prod/deployment.yaml

git add .
git commit -m "Subscribe to quicklab" 
git push -u origin master
```
# The Above Command will take 5-10 minutes to Execute...
- ### Check My Progress For all task Once all the command get execute.
- ### If Last Task get Failed ⬇️
# `To complete the final (Last) task, follow these steps:`

### 1. Navigate to or Search `Cloud Build` and access the `History` section.
### 2. Locate the `second` failed build `(Trigger Name - sample-app-dev-deploy)` and select it or go inside it.
### 3. Click the "Retry" option to initiate the retry process. once or Twice... 
## It will take 1-2 mins and then Check my progress for last task...
          