# Assessing Data Quality with Dataplex || `[GSP1158]`

### Run the following Commands in Cloud Shell

```bash
export REGION=
```

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Assessing%20Data%20Quality%20with%20Dataplex/gsp1158.sh

sudo chmod +x gsp1158.sh

./gsp1158.sh

echo "----------------------"
echo "                      "
echo "BIGQUERY LINK : https://console.cloud.google.com/bigquery?project=$DEVSHELL_PROJECT_ID&ws=!1m0"

echo "TASK LINK : https://console.cloud.google.com/dataplex/process/create-task/data-quality?project=$DEVSHELL_PROJECT_ID"

echo "----------------------"
echo "                      "
```

- Click `BigQuery` Link Or Go from [here](https://console.cloud.google.com/bigquery?)

- In the SQL Editor, click on `Compose a new query`. Paste the following query, and then click `Run`: ( REPLACE PROJECT_ID WITH YOUR PROJECT )

```bash
  SELECT * FROM `PROJECT_ID.customers.contact_info`
  ORDER BY id
  LIMIT 50
```

- CLICK `TASK LINK` >
- DATAPLEX LAKE : `ecommerce-lake`
- DISPLAY NAME : `Customer Data Quality Job`
- SELECT GCS FILE : `<PROJECT_ID>-bucket/dq-customer-raw-data.yaml`
- SELECT BIGQUERY DATASET : BROWSE > `customers_dq_dataset`
- SELECT BIGQUERY TABLE : `dq_results`
- USER SERVICE ACCOUNT : `Compute Engine default service account`
- `CONTINUE` > START IMMEDIATELY > `CREATE`

---

- CLICK Customer Data Quality Job > [RANDOM NUMBER JOB ID] > LET STATUS BE Succeeded
- BACK TO BIGQUERY LINK > EXPAND PROJECT ID > `customers_dq_dataset` > DOUBLE CLICK `dq_summary` >
- PREVIEW > SCROLL RIGHT TO THE END > IN LAST ROW FIRST COLUMN > MAKE THE ARROW TOWARD UPSIDE
- COPY WHOLE QUERY FROM THAT CELL > PASTE IN `BIGQUERY NEW EDITOR` > `RUN`
- AGAIN IN LAST ROW SECOND COLUMN > MAKE THE ARROW TOWARD UPSIDE
- COPY WHOLE QUERY FROM THAT CELL > PASTE IN BIGQUERY NEW EDITOR > RUN

### Congratulations for Completing the Lab !
