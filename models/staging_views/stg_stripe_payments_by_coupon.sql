SELECT *
  FROM {{ source("stripe_payments", "stripe-payments")}}
 WHERE PAYMENTMETHOD = 'coupon'
       AND STATUS = 'success'