# Filtering and Sorting Data in Looker.

### Follow the below steps...
1. Login to Looker.
2. Go to `Explore` > FAA > `Flights`.
3. Under `Flight Details`, select `Measures` > **`Cancelled Count`**.
4. Under `Flights`, select `Dimensions` > `Depart Date`> **`Week`**
5. Click on the filter for date, select `is in the year > 2004`, and click `RUN`.
6. Click on `Settings`, then `Save > As a Look`.
7. Title the look `Cancelled Flight Count by Week in 2004` and **save it**.
8. Go back to Looker.
9. Under `Looker`, select `Explore` > `FAA` > `Flights`.
10. Under `Measures`, select `Count Long Flight` and `Total Distance`.
11. Under `Carriers`, select `Dimensions` > `Name`.
12. Under `Flights`, click on the filter for `Percentage Long Flights`, select `is less than or equal to > .25`, and click **`RUN`**.
13. Click on `Settings`, then `Save > As a Look`.
14. Title the look T`otal Distance and Long Flight Count by Carrier` and **save it**.
15. Go back to Looker.
16. Under `Folders`, select `My Folder`.
17. Select `both looks`, then click `New > Dashboard`.
18. Name the dashboard `Flights Data` and click `Create Dashboard.`
