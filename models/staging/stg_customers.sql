SELECT
  customer_id,
  first_name,
  last_name,
  email,
  phone,
  city,
  state,
  country,
  signup_date,
  status,
  updated_at
FROM {{ source('raw', 'customers') }}