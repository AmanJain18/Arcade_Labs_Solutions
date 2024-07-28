# Get Started with Dataplex: Challenge Lab || `[ARC117]`

### Run the following Commands in CloudShell

```bash
export LOCATION=
```

```bash
curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Get%20Started%20with%20Dataplex%20Challenge%20Lab/arc117.sh

sudo chmod +x arc117.sh

./arc117.sh
```

### Task 3. Create and apply a tag template to a zone

1. Go to Templates from [here](https://console.cloud.google.com/dataplex/templates/create)

## Perform `Task 3` Manually From Lab Instructions.
- OPEN `TAG TEMPLATE` > CREATE `TAG TEMPLATE`
- TEMPLATE DISPlAY NAME : `Protected Raw Data Template`
- TEMPLATE ID : LEAVE AS IT IS
- LOCATION : `REGION GIVEN IN LAB`
- VISIBILITY: `PUBLIC`
- CLICK `ADD FIELD` :-
	- FIELD DISPLAY NAME : `Protected Raw Data Flag`
	- FIELD ID : LEAVE AS IT IS
	- TYPE : `Enumerated`
		- VALUE 1 : `Y`
		- VALUE 2 : `N`
    - CLICK `DONE`
- CLICK `CREATE`

## Wait for creation, then >
- CLICK `SEARCH` FROM `LEFT SIDE MENU`
- CLICK `CLOSE BUTTON`
- SEARCH `Raw Event Data` (`SYSTEM` - `DATAPLEX`)
- CLICK `ATTACH TAGS BUTTON`
- SELECT THE FOLLOWING `FROM DROPDOWN` :
- 1.
	- SELECT `Protected Raw Data Template`
    - Click `OK`
- 2.
	- SELECT `Y`
    - Click `OK`
- CLICK `SAVE`

### Congratulations for completing the Lab!