# Cloud Speech API 3 Ways: Challenge Lab || `[ARC132]`

### Run the following Commands in Cloud Shell

```bash
export ZONE=$(gcloud compute instances list lab-vm --format 'csv[no-heading](zone)')
gcloud compute ssh lab-vm --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet
```

* Go to `Credentials` from [here](https://console.cloud.google.com/apis/credentials)

```bash
export API_KEY=
```

```bash
export task_2_file_name=""
```

```bash
export task_3_request_file=""
```

```bash
export task_3_response_file=""
```

```bash
export task_4_sentence=""
```

```bash
export task_4_file=""
```

```bash
export task_5_sentence=""
```

```bash
export task_5_file=""
```

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Cloud%20Speech%20API%203%20Ways%20Challenge%20Lab/arc132.sh

sudo chmod +x arc132.sh

./arc132.sh
```

### Congratulations for completing the Lab !
