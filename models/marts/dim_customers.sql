WITH customers AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        city,
        state,
        country,
        status,
        updated_at
    FROM {{ ref('stg_customers') }}
),

history AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        city,
        state,
        country,
        status,

        updated_at AS effective_from,

        LEAD(updated_at) OVER (
            PARTITION BY customer_id
            ORDER BY updated_at
        ) AS effective_to

    FROM customers
)

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    city,
    state,
    country,
    status,
    effective_from,
    effective_to,

    CASE
        WHEN effective_to IS NULL THEN TRUE
        ELSE FALSE
    END AS is_current

FROM history;
