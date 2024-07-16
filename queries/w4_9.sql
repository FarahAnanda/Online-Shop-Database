WITH prime_sqft AS (
    SELECT SUM(item_size_sqft) AS total_prime_sqft
    FROM item
    WHERE is_prime = TRUE
),
non_prime_sqft AS (
    SELECT SUM(item_size_sqft) AS total_non_prime_sqft
    FROM item
    WHERE is_prime = FALSE
),
warehouse_capacity AS (
    SELECT
        600000 AS total_area,
        total_prime_sqft,
        total_non_prime_sqft,
        FLOOR(600000 / total_prime_sqft) AS max_prime_qty,
        FLOOR((600000 - (FLOOR(600000 / total_prime_sqft) * total_prime_sqft)) / total_non_prime_sqft) AS max_non_prime_qty
    FROM
        prime_sqft
    CROSS JOIN
        non_prime_sqft
)
SELECT 
    'prime' AS item_type,
    max_prime_qty * 35 AS item_count
FROM 
    warehouse_capacity

UNION ALL

SELECT 
    'non-prime' AS item_type,
    max_non_prime_qty * 15 AS item_count
FROM 
    warehouse_capacity;