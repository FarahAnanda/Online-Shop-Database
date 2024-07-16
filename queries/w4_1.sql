SELECT 
    p.product_id, 
    p.product_name,
    COUNT(s.product_id) AS order_count
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.product_id, p.product_name
HAVING 
    COUNT(s.product_id) > 1
ORDER BY 
    p.product_id;
