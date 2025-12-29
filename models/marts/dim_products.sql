SELECT DISTINCT
  product_id,
  product_name,
  category,
  subcategory,
  brand,
  unit_price
FROM {{ ref('stg_products') }}
