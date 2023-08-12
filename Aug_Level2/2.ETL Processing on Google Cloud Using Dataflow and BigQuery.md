
# ETL Processing on Google Cloud Using Dataflow and BigQuery

### Run in the Cloud Shell

## export REGION :- Given at Task 3.

```bash
export REGION=
```
---
```bash
gcloud services disable dataflow.googleapis.com

gcloud services enable dataflow.googleapis.com

sleep 30

gsutil -m cp -R gs://spls/gsp290/dataflow-python-examples .

export PROJECT=$(gcloud config get-value project)
gcloud config set project $PROJECT

gsutil mb -c regional -l $REGION  gs://$PROJECT

gsutil cp gs://spls/gsp290/data_files/usa_names.csv gs://$PROJECT/data_files/
gsutil cp gs://spls/gsp290/data_files/head_usa_names.csv gs://$PROJECT/data_files/

bq mk lake

docker run -it -e PROJECT=$PROJECT -v $(pwd)/dataflow-python-examples:/dataflow python:3.7 /bin/bash
```
---
## `Now u will be in the root@..... Directory in the Cloud Shell. Now paste all the below command one by one`

```bash
pip install apache-beam[gcp]==2.24.0
cd dataflow/
```

## export REGION Again:- Given at Task 3.

```bash
export REGION=us-central1
```
---
## `Now Below All command will take 8-10 mins to execute respectively...`
# `Make Sure Ur Pc or Laptop Do not go to sleep. Paste 1 Block command at a time, and let it get execute completely.`
```bash
python dataflow_python_examples/data_ingestion.py \
  --project=$PROJECT --region=$REGION \
  --runner=DataflowRunner \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --input gs://$PROJECT/data_files/head_usa_names.csv \
  --save_main_session
```
---
```bash
python dataflow_python_examples/data_transformation.py \
  --project=$PROJECT \
  --region=$REGION \
  --runner=DataflowRunner \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --input gs://$PROJECT/data_files/head_usa_names.csv \
  --save_main_session
```
---
```bash
sed -i "s/values = \[x.decode('utf8') for x in csv_row\]/values = \[x for x in csv_row\]/" ./dataflow_python_examples/data_enrichment.py
```

```bash
python dataflow_python_examples/data_enrichment.py \
  --project=$PROJECT \
  --region=$REGION \
  --runner=DataflowRunner \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --input gs://$PROJECT/data_files/head_usa_names.csv \
  --save_main_session
```
---
```bash
python dataflow_python_examples/data_lake_to_mart.py \
  --worker_disk_type="compute.googleapis.com/projects//zones//diskTypes/pd-ssd" \
  --max_num_workers=4 \
  --project=$PROJECT \
  --runner=DataflowRunner \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --save_main_session \
  --region=$REGION
```



## Check My prpgress for all task, It will take time to update, so don't worry.