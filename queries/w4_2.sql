SELECT 
    COUNT(*) AS product_count
FROM (
    SELECT 
        p.product_id
    FROM 
        sales s
    JOIN 
        products p ON s.product_id = p.product_id
    GROUP BY 
        p.product_id
    HAVING 
        COUNT(s.product_id) > 1
) AS subquery;