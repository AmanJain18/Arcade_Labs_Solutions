# Deploying a Python Flask Web Application to App Engine Flexible
### Run in the Cloud Shell
 - Select ZONE **us-central** when asked...
 - ### And to select **us-central** type 10


```
gcloud storage cp -r gs://spls/gsp023/flex_and_vision/ .
cd flex_and_vision
export PROJECT_ID=$(gcloud config get-value project)
gcloud iam service-accounts create qwiklab \
  --display-name "My Qwiklab Service Account"
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
--member serviceAccount:qwiklab@${PROJECT_ID}.iam.gserviceaccount.com \
--role roles/owner
gcloud iam service-accounts keys create ~/key.json \
--iam-account qwiklab@${PROJECT_ID}.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS="/home/${USER}/key.json"
virtualenv -p python3 env
source env/bin/activate
pip install -r requirements.txt
gcloud app create
export CLOUD_STORAGE_BUCKET=${PROJECT_ID}
gsutil mb gs://${PROJECT_ID}
python main.py
```
____
 📷 [Click Here, > download this image as you will need this in further steps](https://api.time.com/wp-content/uploads/2020/09/time-100-Sundar-Pichai.jpg)


## Open the web preview on port 8080 and proceed to upload the image. After uploading, click the submit button. Then, return to the Cloud Shell and stop the script by pressing Ctrl + C.
____
## Run in Cloud Shell
```
rm -f app.yaml
cat > app.yaml << EOF
runtime: python
env: flex
entrypoint: gunicorn -b :\$PORT main:app

runtime_config:
  python_version: 3.7

env_variables:
  CLOUD_STORAGE_BUCKET: $PROJECT_ID

manual_scaling:
  instances: 1

EOF
gcloud config set app/cloud_build_timeout 1000
gcloud app deploy
```
____
# REGIONS (USE us-central only for this lab > Press 10 )

| Number | Region               |
|-------:|----------------------|
| 1      | `asia-east1`         |
| 2      | `asia-northeast1`    |
| 3      | `asia-south1`        |
| 4      | `asia-southeast1`    |
| 5      | `australia-southeast1` |
| 6      | `europe-central2`    |
| 7      | `europe-west`        |
| 8      | `europe-west2`       |
| 9      | `europe-west3`       |
| 10     | `us-central`         |
| 11     | `us-east1`           |
| 12     | `us-east4`           |
| 13     | `us-west1`           |
| 14     | `us-west2`           |
| 15     | `us-west3`           |
| 16     | `us-west4`           |
| 17     | `cancel`             |

