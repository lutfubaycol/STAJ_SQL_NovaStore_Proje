/*========================================================
  HALİS_LUTFU_BAYCOL_NovaStore_Proje.sql
  NovaStore E-Ticaret Veri Yönetim Sistemi
========================================================*/

----------------------------------------------------------
-- BÖLÜM 1: VERİ TABANI OLUŞTURMA
----------------------------------------------------------
CREATE DATABASE novastoredb;

----------------------------------------------------------
-- BÖLÜM 1: TABLOLAR (DDL)
----------------------------------------------------------

CREATE TABLE categories (
    categoryid SERIAL PRIMARY KEY,
    categoryname VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    customerid SERIAL PRIMARY KEY,
    fullname VARCHAR(50),
    city VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE products (
    productid SERIAL PRIMARY KEY,
    productname VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    stock INT DEFAULT 0,
    categoryid INT REFERENCES categories(categoryid)
);

CREATE TABLE orders (
    orderid SERIAL PRIMARY KEY,
    customerid INT REFERENCES customers(customerid),
    orderdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    totalamount DECIMAL(10,2)
);

CREATE TABLE orderdetails (
    detailid SERIAL PRIMARY KEY,
    orderid INT REFERENCES orders(orderid),
    productid INT REFERENCES products(productid),
    quantity INT
);

----------------------------------------------------------
-- BÖLÜM 2: VERİ GİRİŞİ (DML)
----------------------------------------------------------

INSERT INTO categories (categoryname) VALUES
('Elektronik'),
('Giyim'),
('Kitap'),
('Kozmetik'),
('Ev ve Yaşam');

INSERT INTO products (productname, price, stock, categoryid) VALUES
('Laptop', 25000, 10, 1),
('Kulaklık', 1500, 30, 1),
('Tişört', 500, 25, 2),
('Mont', 3000, 5, 2),
('Roman Kitap', 200, 40, 3),
('Kişisel Gelişim Kitabı', 180, 15, 3),
('Parfüm', 1200, 12, 4),
('Cilt Kremi', 350, 50, 4),
('Kahve Makinesi', 4500, 8, 5),
('Masa Lambası', 600, 18, 5);

INSERT INTO customers (fullname, city, email) VALUES
('Ahmet Yılmaz', 'İstanbul', 'ahmet@gmail.com'),
('Ayşe Demir', 'Ankara', 'ayse@gmail.com'),
('Mehmet Kaya', 'İzmir', 'mehmet@gmail.com'),
('Zeynep Arslan', 'Bursa', 'zeynep@gmail.com'),
('Ali Çelik', 'Antalya', 'ali@gmail.com');

INSERT INTO orders (customerid, orderdate, totalamount) VALUES
(1, '2024-01-10', 26500),
(2, '2024-01-15', 3500),
(3, '2024-02-01', 200),
(1, '2024-02-10', 1200),
(4, '2024-02-15', 600),
(5, '2024-03-01', 4500),
(2, '2024-03-05', 180),
(3, '2024-03-10', 3000);

INSERT INTO orderdetails (orderid, productid, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 4, 1),
(3, 5, 1),
(4, 7, 1),
(5, 10, 1),
(6, 9, 1),
(7, 6, 1),
(8, 4, 1);

----------------------------------------------------------
-- BÖLÜM 3: SORGULAR (DQL)
----------------------------------------------------------

SELECT productname, stock
FROM products
WHERE stock < 20
ORDER BY stock DESC;

SELECT c.fullname, c.city, o.orderdate, o.totalamount
FROM customers c
JOIN orders o ON c.customerid = o.customerid;

SELECT p.productname, p.price, cat.categoryname
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN orderdetails od ON o.orderid = od.orderid
JOIN products p ON od.productid = p.productid
JOIN categories cat ON p.categoryid = cat.categoryid
WHERE c.fullname = 'Ahmet Yılmaz';

SELECT cat.categoryname, COUNT(p.productid) AS urunsayisi
FROM categories cat
LEFT JOIN products p ON cat.categoryid = p.categoryid
GROUP BY cat.categoryname;

SELECT c.fullname, SUM(o.totalamount) AS toplamciro
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.fullname
ORDER BY toplamciro DESC;

SELECT orderid,
       CURRENT_DATE - orderdate::date AS gecengun
FROM orders;

----------------------------------------------------------
-- BÖLÜM 4: VIEW
----------------------------------------------------------

CREATE VIEW vw_siparisozet AS
SELECT 
    c.fullname,
    o.orderdate,
    p.productname,
    od.quantity
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN orderdetails od ON o.orderid = od.orderid
JOIN products p ON od.productid = p.productid;

----------------------------------------------------------
-- BÖLÜM 4: YEDEKLEME
----------------------------------------------------------

-- pg_dump -U postgres novastoredb > C:/Yedek/novastoredb.sql
