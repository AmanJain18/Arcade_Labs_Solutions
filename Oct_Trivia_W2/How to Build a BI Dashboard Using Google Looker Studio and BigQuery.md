# How to Build a BI Dashboard Using Google Looker Studio and BigQuery.

### Run in the Cloud Shell...
```bash
bq mk Reports
bq query \
--use_legacy_sql=false \
--destination_table=$DEVSHELL_PROJECT_ID:Reports.Trees \
'SELECT
 TIMESTAMP_TRUNC(plant_date, MONTH) as plant_month,
  COUNT(tree_id) AS total_trees,
  species,
  care_taker,
  address,
  site_info
FROM
  `bigquery-public-data.san_francisco_trees.street_trees`
WHERE
  address IS NOT NULL
  AND plant_date >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 365 DAY)
  AND plant_date < TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)
GROUP BY
  plant_month,
  species,
  care_taker,
  address,
  site_info'
```
---
- Open in `Incognito Window` [Looker](https://lookerstudio.google.com/) > Blank report > Country `India` > Company `google`

- Agree and continue > `Yes to all` > Continue > `Bigquery` > `Authorize` 

- `GCP ID` > Reports > Trees > ADD > add to report
---
### Run in the Cloud Shell...
```bash
bq query \
    --use_legacy_sql=false \
    --destination_table=Reports.Trees \
    --display_name='Update_trees_daily' \
    --schedule='every 1 hours' \
    --replace=true \
    'SELECT
 TIMESTAMP_TRUNC(plant_date, MONTH) as plant_month,
  COUNT(tree_id) AS total_trees,
  species,
  care_taker,
  address,
  site_info
FROM
  `bigquery-public-data.san_francisco_trees.street_trees`
WHERE
  address IS NOT NULL
  AND plant_date >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)
  AND plant_date < TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY)
GROUP BY
  plant_month,
  species,
  care_taker,
  address,
  site_info'
```
- **Click on the link > Authorize it > Copy the code and paste in terminal and press `Enter`**