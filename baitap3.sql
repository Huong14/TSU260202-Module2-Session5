USE bt3_sanpham;

ALTER TABLE products CHANGE stock category VARCHAR(50);

INSERT INTO products(id,name_pro,price,category) VALUES
    (1,'ip17',30000000,'electronic'),
    (2,'tivi',10000000,'electronic'),
    (3,'shoes',4000000,'sneaker'),
    (4,'ip12',7000000,'electronic'),
    (5,'laptop',25000000,'electronic');
    
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT * FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category = p.category
);

SELECT * FROM products
WHERE category IN (
    SELECT DISTINCT category
    FROM products
    WHERE price > 20000000
);
    