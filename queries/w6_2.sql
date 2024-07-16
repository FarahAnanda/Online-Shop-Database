-- Insert data into the orders table
INSERT INTO orders (order_id, customer_id, payment, order_date, delivery_date)
VALUES 
(1006, 1, 150, '2024-06-01', '2024-06-05'),
(1007, 2, 250, '2024-06-02', '2024-06-06'),
(1008, 3, 300, '2024-06-03', '2024-06-07'),
(1009, 4, 175, '2024-06-04', '2024-06-08'),
(1010, 5, 225, '2024-06-05', '2024-06-09');

-- Insert data into the sales table
INSERT INTO sales (sales_id, order_id, product_id, price_per_unit, quantity, total_price)
VALUES 
(5005, 1006, 10, 15, 10, 150),
(5006, 1007, 11, 25, 10, 250),
(5007, 1008, 12, 30, 10, 300),
(5008, 1009, 13, 17, 10, 175),
(5009, 1010, 14, 22, 10, 225);