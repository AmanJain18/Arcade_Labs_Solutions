# VPC Networking.

## Run in Cloud Shell...
```bash
export ZONE=
```
```bash
export REGION=${ZONE::-2}
gcloud compute firewall-rules delete default-allow-icmp --quiet
gcloud compute firewall-rules delete default-allow-ssh --quiet
gcloud compute firewall-rules delete default-allow-rdp --quiet
gcloud compute firewall-rules delete default-allow-internal --quiet
gcloud compute networks delete default --quiet
gcloud compute networks create mynetwork --subnet-mode auto --description "My VPC Network"
gcloud compute instances create mynet-us-vm --project=$DEVSHELL_PROJECT_ID \
--zone=$ZONE \
--machine-type=e2-micro \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=mynetwork \
--create-disk=auto-delete=yes,boot=yes,device-name=mynet-us-vm,image=projects/debian-cloud/global/images/debian-11-bullseye-v20231010,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced 
gcloud compute instances create mynet-eu-vm --project=$DEVSHELL_PROJECT_ID \
--zone=europe-west1-c \
--machine-type=e2-micro \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=mynetwork \
--create-disk=auto-delete=yes,boot=yes,device-name=mynet-eu-vm,image=projects/debian-cloud/global/images/debian-11-bullseye-v20231010,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/us-east1-c/diskTypes/pd-balanced 
gcloud compute networks update mynetwork --switch-to-custom-subnet-mode --quiet
gcloud compute networks create managementnet --subnet-mode custom
gcloud compute networks subnets create managementsubnet-us \
  --network=managementnet \
  --region=$REGION \
  --range=10.240.0.0/20
gcloud compute networks create privatenet --subnet-mode=custom
gcloud compute networks subnets create privatesubnet-us --network=privatenet --region=$REGION --range=172.16.0.0/24
gcloud compute networks subnets create privatesubnet-eu --network=privatenet --region=europe-west1 --range=172.20.0.0/20
gcloud compute firewall-rules create managementnet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=managementnet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0
gcloud compute firewall-rules create privatenet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=privatenet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0
gcloud compute instances create managementnet-us-vm --zone=$ZONE --machine-type=e2-micro --subnet=managementsubnet-us --image-family=debian-11 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=managementnet-us-vm
gcloud compute instances create privatenet-us-vm --zone=$ZONE --machine-type=e2-micro --subnet=privatesubnet-us --image-family=debian-11 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=privatenet-us-vm
```  