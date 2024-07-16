CREATE VIEW monthly_transaction_summary AS
SELECT 
    EXTRACT(MONTH FROM to_date(order_date, 'YYYY-MM-DD')) AS sale_month,
    EXTRACT(YEAR FROM to_date(order_date, 'YYYY-MM-DD')) AS sale_year,
    SUM(payment) AS total_transaction_amount
FROM 
    orders
GROUP BY 
    EXTRACT(YEAR FROM to_date(order_date, 'YYYY-MM-DD')),
    EXTRACT(MONTH FROM to_date(order_date, 'YYYY-MM-DD'))
ORDER BY 
    sale_year, sale_month;