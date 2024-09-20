{{ config(materialized='table') }}

SELECT *
  FROM hive_metastore.default.stripe_payments
 WHERE PAYMENTMETHOD = 'coupon'