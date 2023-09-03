# Pub/Sub Lite: Qwik Start.
### Run in the Cloud Shell...

#### `REGION` Given in Task 1.
```bash
export REGION=
```
```bash
gcloud services enable pubsublite.googleapis.com
gcloud pubsub lite-reservations create my-lite-topic --location=$REGION --throughput-capacity=1
gcloud pubsub lite-topics create my-lite-topic --location=$REGION --partitions=1 --per-partition-bytes=32212254720 --throughput-reservation=my-lite-topic
gcloud pubsub lite-subscriptions create my-lite-subscription --location=$REGION --topic=my-lite-topic --delivery-requirement=deliver-after-stored
```
