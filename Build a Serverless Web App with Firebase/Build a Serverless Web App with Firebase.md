# Build a Serverless Web App with Firebase || `[GSP643]`

## Copy `IDE` link given in lab instructions

### Run the following Commands in `IDE`

```bash
export REGION=
```

```bash
git clone https://github.com/rosera/pet-theory.git
gcloud config set compute/region $REGION
gcloud app create --region=$REGION
gcloud firestore databases create --region=$REGION
```

* Go to `Firebase Console` from [here](https://console.firebase.google.com/)

### NOW FOLLOw `TASK 4 and TASK 5` STEPS

* Register your app name as `Pet Theory`

### Jump to `TASK 7` and follow it's steps.

## Now, Jump to `TASK 11` *5th Point step* and follow it.
Return to the [Firebase Console](https://console.firebase.google.com/) and click Build > `Firestore Database`

* For Collection ID, paste the following:

```bash
customers
```

* For Document ID, paste your `Username`

* Now paste the following:

| Field |  Type  | Value |
| :---: | :----: | :----: |
| email | string | Username |
| name  | string | John |
| phone | string | 98473757454 |

* Now click `Save`

`Now Check My progress for all tasks.`
### Congratulations for completing the Lab!