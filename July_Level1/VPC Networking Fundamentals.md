# VPC Networking Fundamentals
## Run in Cloud Shell
### Copy the zone from task 2 where the instance create steps are shown in the table...

`eg: us-west1-b` there are two table... copy each zone respectively to zone1 and zone2...

```
export ZONE1=
```
---
```
export ZONE2=
```
---
```
gcloud compute networks create mynetwork \
--project=$DEVSHELL_PROJECT_ID \
--subnet-mode=auto --mtu=1460 \
--bgp-routing-mode=regional
gcloud compute instances create mynet-us-vm \
--project=$DEVSHELL_PROJECT_ID \
--zone=$ZONE1 --machine-type=e2-micro \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=mynetwork \
--metadata=enable-oslogin=true \
--maintenance-policy=MIGRATE \
--provisioning-model=STANDARD \
--create-disk=auto-delete=yes,boot=yes,device-name=mynet-us-vm,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230509,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE1/diskTypes/pd-balanced \
--no-shielded-secure-boot \
--shielded-vtpm \
--shielded-integrity-monitoring \
--labels=goog-ec-src=vm_add-gcloud \
--reservation-affinity=any
gcloud compute instances create mynet-us-vm \
--project=$DEVSHELL_PROJECT_ID \
--zone=$ZONE2 \
--machine-type=e2-micro \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=mynetwork \
--metadata=enable-oslogin=true \
--maintenance-policy=MIGRATE \
--provisioning-model=STANDARD \
--create-disk=auto-delete=yes,boot=yes,device-name=mynet-eu-vm,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230509,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE2/diskTypes/pd-balanced \
--no-shielded-secure-boot \
--shielded-vtpm \
--shielded-integrity-monitoring \
--labels=goog-ec-src=vm_add-gcloud \
--reservation-affinity=any
```
____
