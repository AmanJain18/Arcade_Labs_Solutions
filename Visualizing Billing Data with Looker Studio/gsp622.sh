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

bq query --use_legacy_sql=false \
"
SELECT * FROM \`ctg-storage.bigquery_billing_export.gcp_billing_export_v1_01150A_B8F62B_47D999\`
"

bq query --use_legacy_sql=false \
"
SELECT service.description FROM \`ctg-storage.bigquery_billing_export.gcp_billing_export_v1_01150A_B8F62B_47D999\` GROUP BY service.description
"

bq query --use_legacy_sql=false \
"
SELECT service.description, COUNT(*) AS num FROM \`ctg-storage.bigquery_billing_export.gcp_billing_export_v1_01150A_B8F62B_47D999\` GROUP BY service.description
"

bq query --use_legacy_sql=false \
"
SELECT location.region FROM \`ctg-storage.bigquery_billing_export.gcp_billing_export_v1_01150A_B8F62B_47D999\` GROUP BY location.region
"

bq query --use_legacy_sql=false \
"
SELECT location.region, COUNT(*) AS num FROM \`ctg-storage.bigquery_billing_export.gcp_billing_export_v1_01150A_B8F62B_47D999\` GROUP BY location.region
"

echo "${BG_BLUE}${BOLD}Congratulations For Completing The Lab !!!${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#