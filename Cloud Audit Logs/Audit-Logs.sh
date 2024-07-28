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

echo "${GREEN}${BOLD}Starting${RESET}" "${GREEN}${BOLD}Execution${RESET}"

gsutil mb gs://$DEVSHELL_PROJECT_ID

echo "Hello World!" > sample.txt
gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID

gsutil ls gs://$DEVSHELL_PROJECT_ID

gcloud compute networks create mynetwork --subnet-mode=auto

gcloud compute instances create default-us-vm \
--zone=$ZONE --network=mynetwork \
--machine-type=e2-medium

echo "${BG_BLUE}${BOLD}Congratulations For Completing The Lab !!!${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#