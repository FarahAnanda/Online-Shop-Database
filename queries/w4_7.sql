WITH monthly_sales AS (
    SELECT 
        EXTRACT(MONTH FROM to_date(o.order_date, 'YYYY-MM-DD')) AS sale_month,
        EXTRACT(YEAR FROM to_date(o.order_date, 'YYYY-MM-DD')) AS sale_year,
        s.product_id,
        p.product_name,
        SUM(s.quantity) AS qty_sold
    FROM 
        sales s
    JOIN 
        orders o ON s.order_id = o.order_id
    JOIN 
        products p ON s.product_id = p.product_id
    GROUP BY 
        EXTRACT(YEAR FROM to_date(o.order_date, 'YYYY-MM-DD')),
        EXTRACT(MONTH FROM to_date(o.order_date, 'YYYY-MM-DD')),
        s.product_id,
        p.product_name
),
ranked_sales AS (
    SELECT 
        sale_month,
        sale_year,
        product_id,
        product_name,
        qty_sold,
        RANK() OVER (PARTITION BY sale_year, sale_month ORDER BY qty_sold DESC, product_id ASC) AS rank
    FROM 
        monthly_sales
)
SELECT 
    sale_month,
    sale_year,
    product_id,
    product_name,
    qty_sold
FROM 
    ranked_sales
WHERE 
    rank = 1
ORDER BY 
    sale_year, sale_month;