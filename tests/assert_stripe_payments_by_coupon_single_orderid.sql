WITH PAYMENTS
  AS (
    SELECT * FROM {{ ref('stg_stripe_payments_by_coupon') }}
  )

SELECT ORDERID,
       COUNT(ID) AS num_of_records
  FROM PAYMENTS
 GROUP BY ORDERID
HAVING num_of_records > 1