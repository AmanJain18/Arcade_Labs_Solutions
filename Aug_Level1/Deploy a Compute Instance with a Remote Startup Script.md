# Deploy a Compute Instance with a Remote Startup Script
## Run in the Cloud Shell...

Open This link in normal window of Chrome after `Starting the lab from Level 1 Only For Check My Progress.`
[Link](https://www.cloudskillsboost.google/focuses/1735?catalog_rank=%7B%22rank%22%3A1%2C%22num_filters%22%3A0%2C%22has_search%22%3Atrue%7D&parent=catalog&search_id=25544818)

```bash
export ZONE=
```
---
```bash
export PROJECT_ID=$(gcloud config get-value project)
gsutil mb -b off gs://$PROJECT_ID
wget -O resources-install-web.sh https://www.cloudskillsboost.google/instructions/4685413/download
gsutil cp resources-install-web.sh gs://$PROJECT_ID/
gcloud compute instances add-metadata lab-monitor \
    --metadata startup-script-url=gs://$PROJECT_ID/resources-install-web.sh \
    --zone $ZONE
gcloud compute firewall-rules create http-fw-rule \
    --allow=tcp:80 \
    --source-ranges=0.0.0.0/0 \
    --target-tags=allow-http-traffic \
    --network=default
gcloud compute instances add-tags lab-monitor --tags=allow-http-traffic --zone=$ZONE
gcloud compute instances reset lab-monitor --zone=$ZONE
```
---
## Press `Y` whenever asked

```bash
gcloud compute ssh lab-monitor --zone=$ZONE
```
---
```bash
sudo apt update
sudo apt install apache2
export CLOUDHUSTLERS=$(curl -s http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H "Metadata-Flavor: Google")
curl http://$CLOUDHUSTLERS
```
