# Introduction to APIs in Google Cloud
### Run in the Cloud Shell
```bash
gcloud services enable fitness.googleapis.com
gcloud services enable storage-api.googleapis.com
cat > values.json << EOF
{
  "name": "$DEVSHELL_PROJECT_ID",
  "location": "us",
  "storageClass": "multi_regional"
}
EOF
```
____
### Go to [OAuth 2.0 playground in Incognito Mode Only](https://developers.google.com/oauthplayground/)
### Select `Cloud Storage API V1`
### Select `https://www.googleapis.com/auth/devstorage.full_control`
### Click `Authorize APIs`
### Select your `Qwiklabs account` and then click `Continue`
### Click `Exchange authorization code for tokens`
### Now copy the access token `access_token`
____
## Run in the Cloud Shell
```bash
export OAUTH2_TOKEN=
```
```bash
export PROJECT_ID=$(gcloud config get-value project)
curl -X POST --data-binary @values.json \
    -H "Authorization: Bearer $OAUTH2_TOKEN" \
    -H "Content-Type: application/json" \
    "https://www.googleapis.com/storage/v1/b?project=$PROJECT_ID"
curl -O demo-image.png https://cdn.qwiklabs.com/E4%2BSx10I0HBeOFPB15BFPzf9%2F%2FOK%2Btf7S0Mbn6aQ8fw%3D
output=$(realpath demo-image.png)
export OBJECT=$output
export BUCKET_NAME=$DEVSHELL_PROJECT_ID
curl -X POST --data-binary @$OBJECT \
    -H "Authorization: Bearer $OAUTH2_TOKEN" \
    -H "Content-Type: image/png" \
    "https://www.googleapis.com/upload/storage/v1/b/$BUCKET_NAME/o?uploadType=media&name=demo-image"
```
____
