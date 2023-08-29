# Serverless Firebase Development: Challenge Lab
## Run in the Cloud Shell...
```bash
export Dataset_Service_Name=
```
```bash
export Frontend_Staging_Service_Name=
```
```bash
export Frontend_Production_Service_Name=
```
### Press y when asked and ignore the errors
```bash
gcloud config set run/region us-east1
export PROJECT_ID=$(gcloud config get-value project)
git clone https://github.com/rosera/pet-theory.git
gcloud firestore databases create --location=us-east1
cd pet-theory/lab06/firebase-import-csv/solution
```
```bash
npm install
node index.js netflix_titles_original.csv
```
```bash
cd ~/pet-theory/lab06/firebase-rest-api/solution-01
gcloud run deploy $Dataset_Service_Name \
  --image gcr.io/$PROJECT_ID/rest-api:0.1 \
  --platform managed \
  --allow-unauthenticated
cd ~/pet-theory/lab06/firebase-rest-api/solution-02
gcloud run deploy $Dataset_Service_Name \
  --image gcr.io/$PROJECT_ID/rest-api:0.2 \
  --platform managed \
  --allow-unauthenticated
cd ~/pet-theory/lab06/firebase-frontend
gcloud run deploy $Frontend_Staging_Service_Name \
  --image gcr.io/$PROJECT_ID/frontend-staging:0.1 \
  --platform managed \
  --allow-unauthenticated
cd ~/pet-theory/lab06/firebase-frontend/public
gcloud run deploy $Frontend_Production_Service_Name \
  --image gcr.io/$PROJECT_ID/frontend-production:0.1 \
  --platform managed \
  --allow-unauthenticated
```
