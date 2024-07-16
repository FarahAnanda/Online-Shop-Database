CREATE TABLE products_partitioned (
    product_id SERIAL,
    product_type VARCHAR(100),
    product_name VARCHAR(100) NOT NULL,
    size VARCHAR(100),
    colour VARCHAR(100),
    price INT CHECK (price > 0),
    quantity INT,
    description VARCHAR(100),
    shop_id INT,
    PRIMARY KEY (product_id, product_type)
)
PARTITION BY LIST (product_type);

CREATE TABLE trousers PARTITION OF products_partitioned
    FOR VALUES IN ('Trousers');

CREATE TABLE shirt PARTITION OF products_partitioned
    FOR VALUES IN ('Shirt');

CREATE TABLE jacket PARTITION OF products_partitioned
    FOR VALUES IN ('Jacket');