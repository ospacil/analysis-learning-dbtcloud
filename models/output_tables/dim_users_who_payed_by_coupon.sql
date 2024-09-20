WITH coupon_user_ids
  AS (

SELECT *
  FROM {{ ref('inter_user_ids_with_payment_by_coupon')}}
)

SELECT jaffle_shop_customers.*,
       coupon_user_ids.num_of_success_orders,
       coupon_user_ids.num_of_total_orders,
       coupon_user_ids.total_success_amount
  FROM hive_metastore.default.jaffle_shop_customers
  JOIN coupon_user_ids ON coupon_user_ids.USER_ID = jaffle_shop_customers.ID
  ORDER BY total_success_amount DESC