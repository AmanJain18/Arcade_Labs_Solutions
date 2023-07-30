# The Basics of Google Cloud Compute_ Challenge Lab
## Run in Cloud Shell
```
echo -e "\033[32m$DEVSHELL_PROJECT_ID-bucket\033[0m"
```
**`Or Copy bucket Name given in the lab insrtuctions directly`**
### Now copy the green color highlited text and go to `Navitaion Menu > Cloud Storage > Buckets`
- Click `Create` and in name paste the highlited text that you copyed earlier.
- Click `Create` and if pop-up appear click `Confirm`
---

## Go back to Cloud Shell > Run in Cloud Shell
### Copy the zone `eg: us-west1-a`
```
export ZONE=
```
---
```
gcloud compute instances create my-instance \
--project=$DEVSHELL_PROJECT_ID \
--zone=$ZONE --machine-type=e2-medium \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
--metadata=enable-oslogin=true \
--maintenance-policy=MIGRATE \
--provisioning-model=STANDARD \
--tags=http-server \
--create-disk=auto-delete=yes,boot=yes,device-name=my-instance,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230509,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced \
--no-shielded-secure-boot \
--shielded-vtpm \
--shielded-integrity-monitoring \
--labels=goog-ec-src=vm_add-gcloud \
--reservation-affinity=any
gcloud compute disks create mydisk --size=200GB \
--zone=$ZONE
gcloud compute instances attach-disk my-instance \
--disk mydisk \
--zone=$ZONE
gcloud compute ssh my-instance \
--zone=$ZONE
```
---
```
sudo apt-get update
sudo apt-get install -y nginx
ps auwx | grep nginx
```
____
