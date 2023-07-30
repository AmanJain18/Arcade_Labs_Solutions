# ARC112
### Run in Cloud Shell [Kindly Add your Message inside "" eg: "Hello World!" ]

## **Check Task 4 For Your Lab Message**

```
export MESSAGE=""
```
```
gcloud services enable appengine.googleapis.com
git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git
cd python-docs-samples/appengine/standard_python3/hello_world
gcloud app deploy
rm -f main.py
cat > main.py << EOF

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "$MESSAGE"

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080, debug=True)

EOF
gcloud app deploy
echo -e "\033[32mNow type Y then enter again enter then type N when asked\033[0m"
gcloud compute ssh "lab-setup"
```
```
git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git
cd python-docs-samples/appengine/standard_python3/hello_world
exit
```
____
# Note: After running this above command it ask for Y/n many times then Press Y but at the last step for Zone to use as default like eg: asia-east1, press n > then it will take the zone given in your lab automatically...

## Zone is given in Task 3

## REGIONS

| Number | Region               |
|-------:|----------------------|
| 1      | `asia-east1`         |
| 2      | `asia-northeast1`    |
| 3      | `asia-south1`        |
| 4      | `asia-southeast1`    |
| 5      | `australia-southeast1` |
| 6      | `europe-central2`    |
| 7      | `europe-west`        |
| 8      | `europe-west2`       |
| 9      | `europe-west3`       |
| 10     | `us-central`         |
| 11     | `us-east1`           |
| 12     | `us-east4`           |
| 13     | `us-west1`           |
| 14     | `us-west2`           |
| 15     | `us-west3`           |
| 16     | `us-west4`           |
| 17     | `cancel`             |
