SELECT
  store_id,
  store_name,
  city,
  state,
  region,
  updated_at
FROM {{ source('raw', 'stores') }};
