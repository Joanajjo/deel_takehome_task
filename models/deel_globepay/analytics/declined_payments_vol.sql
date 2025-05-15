SELECT
  SUM(amount_usd) AS total_declined_payments
FROM {{ref("transactions_w_chargeback_status")}}
WHERE state = 'DECLINED'
GROUP BY country
ORDER BY total_declined_payments