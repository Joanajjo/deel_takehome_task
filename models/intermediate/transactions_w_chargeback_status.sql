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
   a.date_time,
   a.state,
   a.cvv_provided,
   a.amount,
   a.country,
   a.currency,
   a.amount_usd,
  
   NULL AS chargeback_date,
   -- Determine if chargeback is missing by whether the left join failed
   CASE
       WHEN cb.external_ref IS NULL THEN TRUE
       ELSE FALSE
   END AS is_missing_chargeback
FROM acceptance a
LEFT JOIN chargebacks cb
   ON a.external_ref = cb.external_ref
