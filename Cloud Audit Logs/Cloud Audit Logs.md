# Cloud Audit Logs

### Run the following Commands in Cloud Shell

```bash
export ZONE=
```

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Cloud%20Audit%20Logs/Audit-Logs.sh

sudo chmod +x Audit-Logs.sh

./Audit-Logs.sh
```

1. Go to `Audit Logs` from [here](https://console.cloud.google.com/iam-admin/audit).
2. Use the `Filter` to locate `Google Cloud Storage`.
3. Check the box next to it.
4. Select `Admin Read`, `Data Read`, and `Data Write`, and then click `SAVE`.

1. Go to `Logs Explorer` from [here](https://console.cloud.google.com/logs/query).
2. Click the `Log name` dropdown and use the filter to locate the `activity` log under the `CLOUD AUDIT` section and `Apply` it to the query.
3. Press the `Run query` button.
4. Delete the existing query and use `Log Name` to view the `data_access` logs.
5. Press the `Run query` button.

### Congratulations for Completing the Lab !