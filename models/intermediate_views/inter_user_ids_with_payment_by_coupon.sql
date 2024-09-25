WITH coupon_orders
   AS (
SELECT *
  FROM {{ ref("stg_stripe_payments_by_coupon") }}
),

jaffle_shop_orders
  AS (
SELECT *
  FROM {{ ref("stg_orders")}}
  )

SELECT customer_id,
       countif(coupon_orders.STATUS = 'success') AS num_of_success_orders,
       count(*) AS num_of_total_orders,
       sum(IF(coupon_orders.STATUS = 'success', AMOUNT, 0)) AS total_success_amount
  FROM jaffle_shop_orders
  JOIN coupon_orders ON coupon_orders.ORDERID = jaffle_shop_orders.order_id
 GROUP BY customer_id