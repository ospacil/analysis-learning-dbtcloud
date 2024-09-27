SELECT ID AS payment_id,
       ORDERID AS order_id,
       PAYMENTMETHOD AS payment_method,
       STATUS AS payment_status,
       AMOUNT AS payment_amount,
       CREATED AS payment_created,
  FROM {{ source("stripe_payments", "stripe-payments")}}