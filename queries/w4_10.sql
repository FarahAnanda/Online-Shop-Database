WITH warehouse_capacity AS (
    SELECT
        (SELECT SUM(item_size_sqft) FROM item WHERE is_prime = TRUE) AS total_prime_sqft,
        (SELECT SUM(item_size_sqft) FROM item WHERE is_prime = FALSE) AS total_non_prime_sqft
)
SELECT 
    (total_prime_sqft * 20) + (total_non_prime_sqft * 20) AS total_wh_area
FROM 
    warehouse_capacity;