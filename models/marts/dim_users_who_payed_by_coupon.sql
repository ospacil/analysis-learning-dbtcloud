WITH coupon_user_ids
  AS (
SELECT *
  FROM {{ ref('inter_user_ids_with_payment_by_coupon')}}
),

jaffle_shop_customers
  AS (
SELECT *
  FROM {{ ref("stg_customers")}}
  )

SELECT jaffle_shop_customers.*,
       coupon_user_ids.num_of_success_orders,
       coupon_user_ids.num_of_total_orders,
       coupon_user_ids.total_success_amount
  FROM jaffle_shop_customers
  JOIN coupon_user_ids
 USING (customer_id)
 ORDER BY total_success_amount DESC