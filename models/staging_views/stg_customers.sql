SELECT ID AS customer_id,
       FIRST_NAME || ' ' || LAST_NAME AS customer_name
  FROM {{ source("jaffle_shop", "jaffle_shop_customers") }}
