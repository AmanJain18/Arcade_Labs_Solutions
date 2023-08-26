PROJECT_ID=`gcloud config get-value project`
BUCKET=${PROJECT_ID}-bucket
gsutil mb gs://$BUCKET
gsutil cp -r gs://spls/gsp431/* gs://$BUCKET

bq mk helpdesk

bq load --autodetect  \
$PROJECT_ID:helpdesk.issues \
gs://$BUCKET/ml/issues.csv


bq query --use_legacy_sql=false \
"CREATE OR REPLACE MODEL \`helpdesk.predict_eta_v0\`
OPTIONS(model_type='linear_reg') AS
SELECT
  category,
  resolutiontime AS label
FROM
  \`helpdesk.issues\`"


bq query --use_legacy_sql=false \
"
WITH eval_table AS (
SELECT
 category,
 resolutiontime as label
FROM
  \`helpdesk.issues\`
)
SELECT
  *
FROM
  ML.EVALUATE(MODEL \`helpdesk.predict_eta_v0\`,
    TABLE eval_table)
"

bq query --use_legacy_sql=false \
"
CREATE OR REPLACE MODEL \`helpdesk.predict_eta\`
OPTIONS(model_type='linear_reg') AS
SELECT
 seniority,
 experience,
 category,
 type,
 resolutiontime as label
FROM
  \`helpdesk.issues\`
"


bq query --use_legacy_sql=false \
"
WITH eval_table AS (
SELECT
 seniority,
 experience,
 category,
 type,
 resolutiontime as label
FROM
  \`helpdesk.issues\`
)
SELECT
  *
FROM
  ML.EVALUATE(MODEL \`helpdesk.predict_eta\`,
    TABLE eval_table)
"



