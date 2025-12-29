SELECT
  order_item_id,
  order_id,
  product_id,
  quantity,
  discount_pct,
  updated_at
FROM {{ source('raw', 'order_items') }}