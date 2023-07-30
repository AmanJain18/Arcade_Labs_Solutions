# Introduction to Cloud Dataproc: Hadoop and Spark on Google Cloud


### Run in the Cloud Shell
```bash
export ZONE=
```
```bash
export CLUSTER_NAME=
```
```bash
export JOB_TYPE=
```
```bash
export MAIN_CLASS=
```
```bash
export JAR_FILE=
```
```cmd
export ARGUMENTS=
```
```bash
export REGION=${ZONE::-2}
gcloud dataproc clusters create qlab --region $REGION --zone $ZONE --master-machine-type e2-standard-4 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type e2-standard-2 --worker-boot-disk-size 500 --image-version 2.0-debian10 --project $DEVSHELL_PROJECT_ID
gcloud dataproc jobs submit spark \
    --cluster=$CLUSTER_NAME \
    --region=$REGION \
    --class=$MAIN_CLASS \
    --jars=$JAR_FILE \
    -- $ARGUMENTS
```
