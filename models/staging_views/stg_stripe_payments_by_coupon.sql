SELECT *
  FROM {{ source("stripe_payments", "stripe_payments")}}
 WHERE PAYMENTMETHOD = 'coupon'