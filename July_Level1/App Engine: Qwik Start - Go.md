# App Engine: Qwik Start - Go
```
export REGION=
```
```
gcloud config set compute/region $REGION
gcloud services enable appengine.googleapis.com
git clone https://github.com/GoogleCloudPlatform/golang-samples.git
cd golang-samples/appengine/go11x/helloworld
sudo apt-get install google-cloud-sdk-app-engine-go
gcloud app deploy
gcloud app browse
```
____
## REGIONS

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