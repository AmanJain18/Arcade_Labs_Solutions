# Consuming Customer Specific Datasets from Data Sharing Partners using BigQuery.

## `Login through Data Sharing Partner Console.`
### Run in the Cloud Shell...
```bash
bq query \
--use_legacy_sql=false \
--destination_table=$DEVSHELL_PROJECT_ID:demo_dataset.authorized_table \
'SELECT * FROM (
SELECT *, ROW_NUMBER() OVER (PARTITION BY state_code ORDER BY area_land_meters DESC) AS cities_by_area
FROM `bigquery-public-data.geo_us_boundaries.zip_codes`) cities
WHERE cities_by_area <= 10 ORDER BY cities.state_code
LIMIT 1000;'
```
### Bigquery > Click on `demo_dataset` 
> Sharing > Authorize datasets > type and select `demo_dataset` > Add Authorization > close

### Click on `authorized_table` > Share
> Add Principal > Paste `Data Publisher and Customer (Data Twin) username` from the lab > Add Role `BigQuery Data Viewer` > save
### Now Close the Incognito Window.
---
## `Login through Publisher Console.`
> For the below project id copy it from `Task 1 step 6` (only projectid)
```bash
PROJECT_ID_1=
```
```bash
bq mk --use_legacy_sql=false --view 'SELECT *
FROM `'$PROJECT_ID_1'.demo_dataset.authorized_table`
WHERE state_code="NY"
LIMIT 1000' data_publisher_dataset.authorized_view
echo "PROJECT_ID_2=$DEVSHELL_PROJECT_ID"
```
### Copy the `PROJECT_ID_2` (From last line shown in terminal) and keep it safely.

### Bigquery > Click on `data_publisher_dataset`
> Sharing > Authorize Views > type and select `data_publisher_dataset` > Add Authorization > close
### Click on `authorized_view` 
> Share > Add Principal > Paste `Customer (Data Twin) username` from the lab > Add Role `BigQuery Data Viewer` > save
### Now Close the Incognito Window.
---
## `Login through Customer (Data Twin) Console.`
> Paste earlier saved project id 2
```bash
PROJECT_ID_2=
```
```bash
bq mk --use_legacy_sql=false --view 'SELECT cities.zip_code, cities.city, cities.state_code, customers.last_name, customers.first_name
FROM `'$DEVSHELL_PROJETC_ID'.customer_dataset.customer_info` as customers
JOIN `'$PROJECT_ID_2'.data_publisher_dataset.authorized_view` as cities
ON cities.state_code = customers.state;' customer_dataset.customer_table
```