# VPC Flow Logs - Analyzing Network Traffic || `[GSP212]`

### Run the following Commands in Cloud Shell
```bash
export ZONE=
```

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/VPC%20Flow%20Logs%20-%20Analyzing%20Network%20Traffic/gsp212.sh

sudo chmod +x gsp212.sh

./gsp212.sh
```

* Go to `allow-http-ssh` Firewall from [here](https://console.cloud.google.com/net-security/firewall-manager/firewall-policies/details/allow-http-ssh?)

* Go to `Create sink` from [here](https://console.cloud.google.com/logs/router/sink?)

* For `Sink Name`, type or paste `vpc-flows` 

* Paste the following in `Build inclusion filter` and Change `PROJECT_ID`

```bash
resource.type="gce_subnetwork"
log_name="projects/PROJECT_ID/logs/compute.googleapis.com%2Fvpc_flows"
```

### Run again the following Commands in Cloud Shell

```bash
export MY_SERVER=$(gcloud compute instances describe web-server --zone=$ZONE \
  --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

for ((i=1;i<=50;i++)); do curl $MY_SERVER; done
```

### Congratulations for Completing the Lab !