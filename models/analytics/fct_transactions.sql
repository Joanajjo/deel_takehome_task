WITH transactions AS (
 SELECT *
 FROM {{ ref('transactions_w_chargeback_status') }}
)
SELECT
 country,
 acceptance_source AS source,
 COUNT(*) AS total_transactions,
 SUM(amount_usd) AS total_amount_usd,
 COUNT_IF(is_missing_chargeback) AS transactions_missing_chargeback,
 COUNT_IF(NOT is_missing_chargeback) AS transactions_with_chargeback,
 ROUND(
   100.0 * COUNT_IF(is_missing_chargeback) / NULLIF(COUNT(*), 0),
   2
 ) AS percent_missing_chargebacks
FROM transactions
GROUP BY country, source
ORDER BY total_amount_usd DESC