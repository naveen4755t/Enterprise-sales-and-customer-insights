SELECT
  order_id,
  customer_id,
  store_id,
  order_date,
  UPPER(order_status) AS order_status,
  payment_method,
  updated_at
FROM {{ source('raw', 'orders') }};
