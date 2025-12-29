SELECT
  order_id,
  order_item_id,
  customer_id,
  store_id,
  product_id,
  order_date,
  order_status,
  quantity,
  gross_amount,
  discount_amount,
  net_amount
FROM {{ ref('int_order_lines') }}
WHERE order_status = 'DELIVERED';
