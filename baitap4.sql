USE bt3_sanpham;

CREATE TABLE customer(
     customer_id INT PRIMARY KEY,
     customer_name VARCHAR(150)
);

ALTER TABLE orders DROP COLUMN total;
ALTER TABLE orders CHANGE id_pro id_cus INT;

ALTER TABLE orders_items CHANGE id_pro id_cus INT;

ALTER TABLE orders_items 
     ADD COLUMN product_name VARCHAR(150),
     ADD COLUMN price DECIMAL(15,2);

INSERT INTO customer (customer_id,customer_name) VALUES
    (1,'Tran Van A'),
    (2,'Tran Van B'),
    (3,'Tran Van C'),
    (4,'Tran Van D'),
    (5,'Tran Van E');

INSERT INTO orders (id,date_or,id_cus) VALUES
    (1,'2026-03-20',2),
    (2,'2026-01-22',4),
    (3,'2026-04-11',3),
    (4,'2026-05-10',5),
    (5,'2026-02-25',1);
    
INSERT INTO orders_items (id_cus,id_or,quantity,product_name,price) VALUES
    (1,5,4,'book',500000),
    (2,1,1,'ip',15500000),
    (3,3,10,'pen',50000),
    (4,2,1,'laptop',25500000),
    (5,4,5,'book',550000);
    
    
SELECT 
    o.id,
    o.date_or,
    c.customer_name
FROM customer c
LEFT JOIN orders o
    ON c.customer_id = o.id_cus;
    

SELECT 
    o.id,
    o.date_or,
    oi.product_name,
    oi.quantity,
    oi.price
FROM orders o
LEFT JOIN orders_items oi
    ON o.id = oi.id_or;
    
    
SELECT 
    o.id,
    o.date_or,
    SUM(oi.quantity * oi.price) AS total_price
FROM orders o
LEFT JOIN orders_items oi
    ON o.id = oi.id_or
GROUP BY o.id, o.date_or;


SELECT 
    o.id,
    o.date_or,
    SUM(oi.quantity * oi.price) AS total_price
FROM orders o
LEFT JOIN orders_items oi
    ON o.id = oi.id_or
GROUP BY o.id, o.date_or
HAVING SUM(oi.quantity * oi.price) > 10000000;