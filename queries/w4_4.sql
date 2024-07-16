SELECT 
    c.customer_id,
    c.customer_name,
    c.home_address,
    EXTRACT(YEAR FROM to_date(o.order_date, 'YYYY-MM-DD')) AS order_year,
    EXTRACT(MONTH FROM to_date(o.order_date, 'YYYY-MM-DD')) AS order_month,
    COUNT(o.order_id) AS total_orders
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_id, 
    c.customer_name, 
    c.home_address,
    EXTRACT(YEAR FROM to_date(o.order_date, 'YYYY-MM-DD')),
    EXTRACT(MONTH FROM to_date(o.order_date, 'YYYY-MM-DD'))
HAVING 
    COUNT(o.order_id) > 2
ORDER BY 
    c.customer_id, order_year, order_month;