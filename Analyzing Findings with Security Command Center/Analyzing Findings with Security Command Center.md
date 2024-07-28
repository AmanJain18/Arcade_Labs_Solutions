# Analyzing Findings with Security Command Center || `[GSP1164]`

### Run the following Commands in Cloud Shell

```bash
export ZONE=
```

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Analyzing%20Findings%20with%20Security%20Command%20Center/gsp1164-1.sh

sudo chmod +x gsp1164-1.sh

./gsp1164-1.sh

echo "SCC LINK : https://console.cloud.google.com/security/command-center/config/continuous-exports/pubsub?project=$PROJECT_ID"
```

### Set Up Continuous Export

# Click SCC Link in Terminal

#### In `Incognito Window`:
### Follow these steps in the browser

* EXPORT NAME: `export-findings-pubsub`
* EXPORT DESCRIPTION: `Continuous exports of Findings to Pub/Sub and BigQuery`
* PROJECT: `YOUR_PROJECT_ID`
* TOPIC: Select `export-findings-pubsub-topic` from dropdown
* FINDINGS QUERY: Automatically populated
* Click `SAVE`

### Run again the following Commands in Cloud Shell

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Analyzing%20Findings%20with%20Security%20Command%20Center/gsp1164-2.sh

sudo chmod +x gsp1164-2.sh

./gsp1164-2.sh
```
### Click Pull Button Link in Terminal

#### Follow these steps in the browser

* Click the `Pull` button in the Google Cloud Console.

### Continue with Cloud Shell commands

```bash
bq query --apilog=/dev/null --use_legacy_sql=false  \
"SELECT finding_id,event_time,finding.category FROM continuous_export_dataset.findings"

echo "----------------------"
echo "                      "

echo "CLOUD STORAGE LINK : https://console.cloud.google.com/storage/create-bucket?project=$PROJECT_ID"

echo "----------------------"
echo "                      "

echo "SSC LINK : https://console.cloud.google.com/security/command-center/findingsv2;filter=state%3D%22ACTIVE%22%0AAND%20NOT%20mute%3D%22MUTED%22;timeRange=allTime?project=$PROJECT_ID"

echo "----------------------"
echo "                      "
echo "BIGQUERY LINK : https://console.cloud.google.com/bigquery?project=$PROJECT_ID&ws=!1m0"

echo "----------------------"
echo "                      "

echo "BUCKET NAME : scc-export-bucket-$PROJECT_ID"

echo "----------------------"
echo "                      "

```

#### Note: It may take `10+ minutes` for these findings to be generated. Rerun the above command if you don't receive a similar output.

#### YOU CAN DO FURTHER STEPS TILL THE TIME
* Go to `Create a bucket` from [here](https://console.cloud.google.com/storage/create-bucket)

* For BUCKET NAME type `scc-export-bucket-`YOUR_PROJECT_ID and CLICK `CONTINUE`
* `REGION` : *REGION GIVEN IN INSTRUCTIONS* > CLICK `CREATE` 
* FOR POP UP "Public access will be prevented" > CLICK `CONFIRM`

* Now go to `Export findings to Cloud Storage` from [here](https://console.cloud.google.com/security/command-center/export)

* Set the filename to `findings.jsonl`

* Go to `BigQuery Studio` from [here](https://console.cloud.google.com/bigquery)

* Set the TABLE NAME to `old_findings`

* Now paste in the following schema

```json
[
  {
    "mode": "NULLABLE",
    "name": "resource",
    "type": "JSON"
  },
  {
    "mode": "NULLABLE",
    "name": "finding",
    "type": "JSON"
  }
]
```

### Congratulations for completing the Lab !