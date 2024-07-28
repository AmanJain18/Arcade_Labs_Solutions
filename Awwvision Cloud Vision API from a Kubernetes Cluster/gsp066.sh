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

gcloud config set compute/zone $ZONE

gcloud container clusters create awwvision \
    --num-nodes 2 \
    --scopes cloud-platform

gcloud container clusters get-credentials awwvision

kubectl cluster-info

sudo apt-get install -y virtualenv

python3 -m venv venv

source venv/bin/activate

gsutil -m cp -r gs://spls/gsp066/cloud-vision .

cd cloud-vision/python/awwvision

make all

kubectl get pods

sleep 5 

kubectl get pods

kubectl get deployments -o wide

kubectl get svc awwvision-webapp

echo "${BLUE}${BOLD}Congratulations${RESET}" "${WHITE}${BOLD}for${RESET}" "${BLUE}${BOLD}Completing the Lab !!!${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#