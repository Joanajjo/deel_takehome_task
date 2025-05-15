with source as (
   select * from {{ source('deel', 'acceptance') }}
)
SELECT
   *,
   CASE
       WHEN currency = 'USD' THEN amount
       WHEN currency = 'CAD' THEN amount / 1.1415
       WHEN currency = 'EUR' THEN amount / 0.926
       WHEN currency = 'MXN' THEN amount / 25.103
       WHEN currency = 'SGD' THEN amount / 1.434
       WHEN currency = 'AUD' THEN amount / 1.648
       WHEN currency = 'GBP' THEN amount / 0.813
       ELSE amount 
   END AS amount_usd,
   CASE
       WHEN currency = 'CAD' THEN 'Canada'
       WHEN currency = 'EUR' THEN 'Europe'
       WHEN currency = 'MXN' THEN 'Mexico'
       WHEN currency = 'SGD' THEN 'Singapore'
       WHEN currency = 'AUD' THEN 'Australia'
       WHEN currency = 'GBP' THEN 'United Kingdom'
       WHEN currency = 'USD' THEN 'United States'
       ELSE 'Unknown' 
   END AS country
FROM source
