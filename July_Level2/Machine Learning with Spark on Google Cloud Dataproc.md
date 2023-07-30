# Machine Learning with Spark on Google Cloud Dataproc.

### Run in the Cloud Shell

### Type `Y` then press two times `Enter` and then Type `n`
```bash
gcloud compute ssh "startup-vm" --project $DEVSHELL_PROJECT_ID
```
```bash
git clone https://github.com/GoogleCloudPlatform/data-science-on-gcp/
cd ~/data-science-on-gcp/06_dataproc
export PROJECT_ID=$(gcloud info --format='value(config.project)')
export BUCKET_NAME=$PROJECT_ID-dsongcp
./create_cluster.sh $BUCKET_NAME us-west1
```
It will take 2 - 3 minutes to execute above command...
---
```
exit
```
---
```bash
curl -LJO https://github.com/AmanJain18/Arcade_Labs_Solutions/blob/main/July_Level2/files/GSP271.ipynb
gsutil cp GSP271.ipynb gs://dataproc-staging*/notebooks/jupyter
```
- Navigate to [Navigation menu > Dataproc](https://console.cloud.google.com/dataproc/clusters) > ch6cluster > Web Interfaces > JupyterLab. 
    - In this location, you will find a file named `GSP271.ipynb`. 
    - Download that file in your system, then delete file from dataproc and re upload that download file by clicking ⬆ icon
    - Open the file and execute all commands by pressing `SHIFT + ENTER`. Or `At top u will find run button (In Jypter Navbar) click on that > Run all commands...`