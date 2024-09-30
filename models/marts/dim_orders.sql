WITH ORDER_INFO
  AS (
    SELECT * 
      FROM {{ ref('stg_orders') }}
  ),

PAYMENT_INFO
  AS (
    SELECT *
      FROM {{ ref('stg_stripe_payments') }}
  )

SELECT CAST(order_id AS STRING) || '_' || CAST(payment_id AS STRING) AS order_payment_id, 
       *,
       IF(payment_id IS NULL, FALSE, TRUE) AS order_payment_attempted
  FROM ORDER_INFO
  LEFT JOIN PAYMENT_INFO
 USING (order_id)