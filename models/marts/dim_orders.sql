WITH ORDER_INFO
  AS (
    SELECT * 
      FROM {{ ref('stg_orders') }}
  ),

PAYMENT_INFO
  AS (
    SELECT *
      FROM {{ ref('stg_stripe_payments') }}
     WHERE payment_status = 'success'
  )

SELECT *, IF(payment_id IS NULL, FALSE, TRUE) AS order_has_been_paid
  FROM ORDER_INFO
  LEFT JOIN PAYMENT_INFO
 USING (order_id)