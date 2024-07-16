CREATE TABLE orders_partitioned (
    order_id SERIAL,
    customer_id INT,
    payment INT,
    order_date DATE,
    delivery_date DATE,
    PRIMARY KEY (order_id, order_date),
    CONSTRAINT order_date_check CHECK (order_date >= DATE '2021-01-01')
)
PARTITION BY RANGE (order_date);

-- Q1 (January 1 - March 31)
CREATE TABLE orders_q1 PARTITION OF orders_partitioned
    FOR VALUES FROM ('2021-01-01') TO ('2021-04-01');

-- Q2 (April 1 - June 30)
CREATE TABLE orders_q2 PARTITION OF orders_partitioned
    FOR VALUES FROM ('2021-04-01') TO ('2021-07-01');

-- Q3 (July 1 - September 30)
CREATE TABLE orders_q3 PARTITION OF orders_partitioned
    FOR VALUES FROM ('2021-07-01') TO ('2021-10-01');

-- Q4 (October 1 - December 31)
CREATE TABLE orders_q4 PARTITION OF orders_partitioned
    FOR VALUES FROM ('2021-10-01') TO ('2022-01-01');

CREATE TABLE orders_default PARTITION OF orders_partitioned
    DEFAULT;

INSERT INTO orders_partitioned (order_id, customer_id, payment, order_date, delivery_date)
SELECT 
    order_id, 
    customer_id, 
    payment, 
    to_date(order_date, 'YYYY-MM-DD') AS order_date, 
    to_date(delivery_date, 'YYYY-MM-DD') AS delivery_date
FROM orders
WHERE order_date >= '2021-01-01';