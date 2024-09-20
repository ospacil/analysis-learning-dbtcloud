WITH coupon_orders
   AS (
SELECT *
  FROM {{ ref("stripe_payments_by_coupon") }}
)

SELECT USER_ID,
       count_if(coupon_orders.STATUS = 'success') AS num_of_success_orders,
       count(*) AS num_of_total_orders,
       sum(IF(coupon_orders.STATUS = 'success', AMOUNT, 0)) AS total_success_amount
  FROM hive_metastore.default.jaffle_shop_orders 
  JOIN coupon_orders ON coupon_orders.ORDERID = jaffle_shop_orders.ID
 GROUP BY USER_ID