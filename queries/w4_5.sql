SELECT 
    o.customer_id,
    MIN(to_date(o.order_date, 'YYYY-MM-DD')) AS first_order_date,
    MAX(to_date(o.order_date, 'YYYY-MM-DD')) AS last_order_date
FROM 
    orders o
GROUP BY 
    o.customer_id
ORDER BY 
    o.customer_id
LIMIT 10;