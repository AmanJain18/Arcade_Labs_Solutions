# Introduction to SQL for BigQuery and Cloud SQL

### Run in the Cloud Shell
### Get Region from Task 5
```bash
export REGION=
```
---
```bash
gsutil mb gs://$DEVSHELL_PROJECT_ID
curl -O -L https://github.com/CodingWithHardik/Level-2-Data-Deep-Dive/blob/master/files/start_station_data.csv
curl -O -L https://github.com/CodingWithHardik/Level-2-Data-Deep-Dive/blob/master/files/end_station_data.csv
gsutil cp start_station_data.csv gs://$DEVSHELL_PROJECT_ID
gsutil cp end_station_data.csv gs://$DEVSHELL_PROJECT_ID
gcloud sql instances create my-demo --database-version=MYSQL_5_7 --region=$REGION --tier=db-n1-standard-1 --root-password=""
gcloud sql connect my-demo --user=root --quiet
```
## Above command will ask for `Password` just press enter dont type anything...

```bash
CREATE DATABASE bike;
```
