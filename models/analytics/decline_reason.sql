SELECT
reason_code,
 COUNT(*) AS declined_count,
 SUM(amount_usd) AS total_declined_usd,
 ROUND(AVG(amount_usd), 2) AS avg_decline_amount_usd
FROM {{ ref('transactions_w_chargeback_status') }}
WHERE state = 'DECLINED'
GROUP BY reason_code
ORDER BY total_declined_usd DESC