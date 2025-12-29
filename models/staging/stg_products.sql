SELECT
  product_id,
  product_name,
  category,
  subcategory,
  brand,
  unit_price,
  updated_at
FROM {{ source('raw', 'products') }};
