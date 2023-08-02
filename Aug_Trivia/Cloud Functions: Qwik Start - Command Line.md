# Cloud Functions: Qwik Start - Command Line

### Run in the Cloud Shell
```bash
export REGION=
```
---
```bash
gcloud config set compute/region $REGION
mkdir gcf_hello_world
cd gcf_hello_world
cat > index.js << EOF
exports.helloWorld = (data, context) => {
const pubSubMessage = data;
const name = pubSubMessage.data
    ? Buffer.from(pubSubMessage.data, 'base64').toString() : "Hello World";
console.log("My Cloud Function: "+name);
};
EOF
gsutil mb -p $DEVSHELL_PROJECT_ID gs://$DEVSHELL_PROJECT_ID
gcloud functions deploy helloWorld \
--stage-bucket $DEVSHELL_PROJECT_ID \
--trigger-topic hello_world \
--runtime nodejs20
```