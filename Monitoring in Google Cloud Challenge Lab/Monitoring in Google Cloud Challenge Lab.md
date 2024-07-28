# Monitoring in Google Cloud: Challenge Lab || `[ARC115]`


## TASK 1:

```bash
curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh --also-install
```

```bash
curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh --also-install
```

```bash
(cd /etc/stackdriver/collectd.d/ && sudo curl -O https://raw.githubusercontent.com/Stackdriver/stackdriver-agent-service-configs/master/etc/collectd.d/apache.conf)
```

```bash
sudo service stackdriver-agent restart
```

## TASK 3:

```bash
timeout 120 bash -c -- 'while true; do curl localhost | grep -oP ".*"; sleep .1s;done '
```

## TASK 5
```bash
resource.type="gce_instance"
logName="projects/$DEVSHELL_PROJECT_ID/logs/apache-access"
textPayload:"200"
```

## Congratulations, you're all done with the lab 😄
