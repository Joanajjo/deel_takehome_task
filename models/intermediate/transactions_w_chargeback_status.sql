WITH acceptance AS (
   SELECT *
   FROM {{ ref('stg_acceptance') }}
),
chargebacks AS (
   SELECT *
   FROM {{ ref('stg_chargeback') }}
)
SELECT
   a.external_ref,
   a.status AS acceptance_status,
   a.source AS acceptance_source,
   a.ref,
   a.transaction_timestamp,
   a.state,
   a.cvv_provided,
   a.amount,
   a.country,
   a.currency,
   a.usd_rate,
   a.amount_usd,
   -- Since chargeback_date does not exist, I opted explicitly setting it as NULL
   NULL AS chargeback_date,
   -- Determine if chargeback is missing by whether the left join failed
   CASE
       WHEN cb.external_ref IS NULL THEN TRUE
       ELSE FALSE
   END AS is_missing_chargeback
FROM acceptance a
LEFT JOIN chargebacks cb
   ON a.external_ref = cb.external_ref