WITH customer_spend AS (
    SELECT 
        c.customer_id, 
        c.customer_name,
        SUM(s.total_price) AS total_spend,
        SUM(s.quantity) AS qty_order
    FROM 
        sales s
    JOIN 
        products p ON s.product_id = p.product_id
    JOIN 
        orders o ON s.order_id = o.order_id
    JOIN 
        customers c ON o.customer_id = c.customer_id
    WHERE 
        p.product_type = 'Trousers'
    GROUP BY 
        c.customer_id, c.customer_name
    ORDER BY 
        total_spend DESC
    LIMIT 5
),
total_trousers_stats AS (
    SELECT 
        SUM(s.quantity) AS qty_trousers,
        AVG(s.total_price) AS avg_spend_trousers
    FROM 
        sales s
    JOIN 
        products p ON s.product_id = p.product_id
    WHERE 
        p.product_type = 'Trousers'
)
SELECT 
    cs.customer_id,
    cs.customer_name,
    cs.total_spend,
    cs.qty_order,
    tt.qty_trousers,
    tt.avg_spend_trousers
FROM 
    customer_spend cs,
    total_trousers_stats tt
ORDER BY 
    cs.total_spend DESC;