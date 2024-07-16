INSERT INTO products_partitioned (product_id, product_type, product_name, size, colour, price, quantity, description, shop_id)
SELECT 
    product_id, 
    product_type, 
    product_name, 
    size, 
    colour, 
    price, 
    quantity, 
    description, 
    shop_id
FROM products;

SELECT * FROM trousers;