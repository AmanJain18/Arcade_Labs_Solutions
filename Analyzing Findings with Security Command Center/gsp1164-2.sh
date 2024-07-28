BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`

#----------------------------------------------------start--------------------------------------------------#

echo "${BG_GREEN}${BOLD}Starting Execution${RESET}"

gcloud compute instances create instance-1 --zone=$ZONE \
--machine-type e2-micro \
--scopes=https://www.googleapis.com/auth/cloud-platform

bq --location=$REGION --apilog=/dev/null mk --dataset \
$PROJECT_ID:continuous_export_dataset

gcloud services enable securitycenter.googleapis.com

gcloud scc bqexports create scc-bq-cont-export --dataset=projects/$PROJECT_ID/datasets/continuous_export_dataset --project=$PROJECT_ID

for i in {0..2}; do
gcloud iam service-accounts create sccp-test-sa-$i;
gcloud iam service-accounts keys create /tmp/sa-key-$i.json \
--iam-account=sccp-test-sa-$i@$PROJECT_ID.iam.gserviceaccount.com;
done

echo "PULL BUTTON LINK : https://console.cloud.google.com/cloudpubsub/subscription/detail/export-findings-pubsub-topic-sub?project=$PROJECT_ID&tab=messages"

#-----------------------------------------------------end----------------------------------------------------------#