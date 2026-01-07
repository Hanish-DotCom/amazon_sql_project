use amazon_db;
-- Data Validation & Cleaning

------------------------------------------
-- Row-count & load confirmation

SELECT COUNT(*) FROM category;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM orders_items;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM shipping;
SELECT COUNT(*) FROM inventory;

-- Foreign-key integrity checks

-------------------------------------------
-- Orders without customers (should be 0)

SELECT COUNT(*)
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- Order items without products

SELECT COUNT(*)
FROM orders_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Payments without orders

SELECT COUNT(*)
FROM payments p
LEFT JOIN orders o
ON p.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Data type normalization

SET SQL_SAFE_UPDATES = 0;
-- IN payments table change(payment_date)varchar format data type into date format

UPDATE payments
SET payment_date = STR_TO_DATE(payment_date, '%d-%m-%Y');
ALTER TABLE payments
MODIFY payment_date DATE;

-- IN shipping table change(shipping_date,return_date)varchar format data type into date format

-- Check for empty strings in return_date
SELECT COUNT(*) 
FROM shipping 
WHERE return_date = '';

UPDATE shipping
SET return_date = NULL
WHERE return_date = '';

-- Modify columns to DATE type
ALTER TABLE shipping
MODIFY shipping_date DATE,
MODIFY return_date DATE;

-- Inventory Table: Convert last_stock_date from VARCHAR to DATE
UPDATE inventory
SET last_stock_date = STR_TO_DATE(last_stock_date, '%d-%m-%Y');

ALTER TABLE inventory
MODIFY last_stock_date DATE;
