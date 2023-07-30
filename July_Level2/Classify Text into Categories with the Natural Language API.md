# Classify Text into Categories with the Natural Language API


### Run in the Cloud Shell

```bash
export PROJECT_ID=$(gcloud config get-value project)
gcloud services enable language.googleapis.com
```
---

## Task 2
To create an API key, in your Console, click Navigation menu > APIs & Services > Credentials.
- Then click Create credentials.
- In the drop down menu, select API key.
- Next, copy the key you just generated, paste it in notepad then click Close.

## Open the Navigation menu and select `Compute Engine > VM Instances`.

Click on the SSH button. You be brought to an interactive shell. then copy below command...

========= Run in SSH ============

```bash
export API_KEY=
```
---
```bash
nano request.json
```
### Paste Following code
```bash
{
  "document":{
    "type":"PLAIN_TEXT",
    "content":"A Smoky Lobster Salad With a Tapa Twist. This spin on the Spanish pulpo a la gallega skips the octopus, but keeps the sea salt, olive oil, pimentón and boiled potatoes."
  }
}
```
Then Press `Ctrt+X`, `Y`, `Enter`
## **Paste below code in SSH Only**
```bash
curl "https://language.googleapis.com/v1/documents:classifyText?key=${API_KEY}" \
  -s -X POST -H "Content-Type: application/json" --data-binary @request.json

  curl "https://language.googleapis.com/v1/documents:classifyText?key=${API_KEY}" \
  -s -X POST -H "Content-Type: application/json" --data-binary @request.json > result.json
```
---

### Run in the Cloud Shell

```bash
bq mk --dataset $PROJECT_ID:news_classification_dataset
bq mk --table $PROJECT_ID:news_classification_dataset.article_data article_text:string,category:string,confidence:float
```
