# Get Started with Pub\Sub: Challenge Lab
### Run in the Cloud Shell...
Paste `REGION` and `MESSAGE_BODY` from `Task 2` (Paste Message inside "")
```bash
export REGION=us-central1
```
```bash
export MESSAGE_BODY="Hello World!"
```
```bash
gcloud services enable cloudscheduler.googleapis.com

gcloud pubsub topics create $DEVSHELL_PROJECT_ID-cron-topic

gcloud pubsub subscriptions create $DEVSHELL_PROJECT_ID-cron-sub --topic=$DEVSHELL_PROJECT_ID-cron-topic

gcloud scheduler jobs create pubsub $DEVSHELL_PROJECT_ID-cron-scheduler-job \
    --schedule="* * * * *" \
    --topic=$DEVSHELL_PROJECT_ID-cron-topic \
    --message-body="$MESSAGE_BODY" \
    --time-zone="America/New_York" \
    --description="Cron job for qwiklabs" \
    --location=$REGION

gcloud pubsub subscriptions pull $DEVSHELL_PROJECT_ID-cron-sub --limit 5
```