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

echo "${GREEN}${BOLD} Starting Execution${RESET}"

gcloud services enable appengine.googleapis.com

sleep 10

git clone https://github.com/GoogleCloudPlatform/java-docs-samples.git

cd java-docs-samples/appengine-java8/helloworld

mvn clean
mvn package

timeout 30 mvn appengine:run &

sleep 30

gcloud app create --region=$REGION

sed -i "s/myProjectId/$DEVSHELL_PROJECT_ID/g" pom.xml

mvn package appengine:deploy

gcloud app browse

echo "${BG_BLUE}${BOLD}Congratulations For Completing The Lab !!!${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#