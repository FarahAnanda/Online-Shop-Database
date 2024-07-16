-- Create shops table
CREATE TABLE public.shops (
    shop_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE
);

-- Create carts table
CREATE TABLE public.carts (
    cart_id SERIAL PRIMARY KEY,
    customer_id INT,
    cart_date DATE,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES public.customers (customer_id),
    FOREIGN KEY (product_id) REFERENCES public.products (product_id)
);

-- Alter products table to include shop_id
ALTER TABLE public.products
ADD COLUMN shop_id INT,
ADD FOREIGN KEY (shop_id) REFERENCES public.shops (shop_id);