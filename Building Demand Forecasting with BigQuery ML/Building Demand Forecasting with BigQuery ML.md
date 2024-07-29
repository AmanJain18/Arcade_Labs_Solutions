# Building Demand Forecasting with BigQuery ML || `[GSP852]`

### Run the following Commands in Cloud Shell

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Building%20Demand%20Forecasting%20with%20BigQuery%20ML/gsp852-1.sh

sudo chmod +x gsp852-1.sh

./gsp852-1.sh
```

### Create the table

```bash
SELECT
 DATE(starttime) AS trip_date,
 start_station_id,
 COUNT(*) AS num_trips
FROM
 `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
 starttime BETWEEN DATE('2014-01-01') AND ('2016-01-01')
 AND start_station_id IN (521,435,497,293,519)
GROUP BY
 start_station_id,
 trip_date
```

- Select `SAVE RESULTS` .

- In the dropdown menu, select `BigQuery Table`.

- For Dataset select `bqmlforecast`.

- Add a Table name `training_data` .

- Click _EXPORT_.

### Run again the following Commands in Cloud Shell

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Building%20Demand%20Forecasting%20with%20BigQuery%20ML/gsp852-2.sh

sudo chmod +x gsp852-2.sh

./gsp852-2.sh
```

### Congratulations for completing the Lab !
