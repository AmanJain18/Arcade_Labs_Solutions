# Use Go Code to Work with Google Cloud Data Sources
## Run in Cloud Shell


```
export PROJECT_ID=$(gcloud info --format="value(config.project)")
git clone https://github.com/GoogleCloudPlatform/DIY-Tools.git
gcloud firestore import gs://$PROJECT_ID-firestore/prd-back
cd ~/DIY-Tools/gcp-data-drive/cmd/webserver
go build -mod=readonly -v -o gcp-data-drive
./gcp-data-drive
```
____
# Open a NEW Cloud Shell tab (Hint: Click +)
- Click the Web Preview button and select **Preview on port 8080** in your Cloud Shell tab.
- This will open a new browser tab with Cloud Shell's service url.
- 
## Copy the service url (your web preview page) without the `/?authuser=0` at the end.

```
export PREVIEW_URL=
```
____
## After running this command, open the URL highlighted in green in a new tab.


```
export PROJECT_ID=$(gcloud info --format="value(config.project)")
echo $PREVIEW_URL/fs/$PROJECT_ID/symbols/product/symbol
echo -e "\033[32m$PREVIEW_URL/bq/$PROJECT_ID/publicviews/ca_zip_codes?authuser=0&environment_name=default\033[0m"
```
```cmd
cd ~/DIY-Tools/gcp-data-drive/cmd/webserver
gcloud app deploy app.yaml --project $PROJECT_ID -q
export TARGET_URL=https://$(gcloud app describe --format="value(defaultHostname)")
curl $TARGET_URL/fs/$PROJECT_ID/symbols/product/symbol
curl $TARGET_URL/fs/$PROJECT_ID/symbols/product/symbol/008888166900
curl $TARGET_URL/bq/$PROJECT_ID/publicviews/ca_zip_codes
```
____
