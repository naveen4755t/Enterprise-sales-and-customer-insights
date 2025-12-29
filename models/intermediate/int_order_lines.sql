SELECT
  o.order_id,
  o.customer_id,
  o.store_id,
  o.order_date,
  o.order_status,
  oi.order_item_id,
  oi.product_id,
  oi.quantity,
  p.unit_price,
  oi.discount_pct,
  (oi.quantity * p.unit_price) AS gross_amount,
  (oi.quantity * p.unit_price) * (oi.discount_pct/100) AS discount_amount,
  (oi.quantity * p.unit_price) - ((oi.quantity * p.unit_price) * (oi.discount_pct/100)) AS net_amount
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_order_items') }} oi ON o.order_id = oi.order_id
JOIN {{ ref('stg_products') }} p ON oi.product_id = p.product_id;
