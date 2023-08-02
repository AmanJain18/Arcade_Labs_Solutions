# APIs Explorer: Cloud Storage

### Run in the Cloud Shell

```bash
export BUCKET=$(gcloud config get-value project)
gsutil mb "gs://$BUCKET"
gsutil mb "gs://$BUCKET-2"
```

```bash
curl -O https://github.com/AmanJain18/Arcade_Labs_Solutions/raw/main/Aug_Trivia/files/demo-image1.png
gsutil cp -r demo-image1.png gs://$BUCKET
curl -O https://github.com/AmanJain18/Arcade_Labs_Solutions/raw/main/Aug_Trivia/files/demo-image2.png
gsutil cp -r demo-image2.png gs://$BUCKET
```

```bash
gsutil cp gs://$BUCKET/demo-image1.png gs://$BUCKET-2/demo-image1.png
gsutil mv gs://$BUCKET-2/demo-image1.png gs://$BUCKET-2/demo-image1-copy.png
```