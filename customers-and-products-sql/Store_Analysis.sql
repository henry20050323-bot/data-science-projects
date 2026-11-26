-- Customers and Products Analysis Using SQL | SQLite
-- Run the entire script in one connection to stores.db.
-- The baseline includes all recorded order statuses, following the exercise.
-- Only session-local views are created. Monetary values are in USD.

-- 1. Database inventory
SELECT 'customers' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('customers')) AS columns, COUNT(*) AS rows FROM customers
UNION ALL
SELECT 'employees' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('employees')) AS columns, COUNT(*) AS rows FROM employees
UNION ALL
SELECT 'offices' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('offices')) AS columns, COUNT(*) AS rows FROM offices
UNION ALL
SELECT 'orderdetails' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('orderdetails')) AS columns, COUNT(*) AS rows FROM orderdetails
UNION ALL
SELECT 'orders' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('orders')) AS columns, COUNT(*) AS rows FROM orders
UNION ALL
SELECT 'payments' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('payments')) AS columns, COUNT(*) AS rows FROM payments
UNION ALL
SELECT 'productlines' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('productlines')) AS columns, COUNT(*) AS rows FROM productlines
UNION ALL
SELECT 'products' AS table_name, (SELECT COUNT(*) FROM pragma_table_info('products')) AS columns, COUNT(*) AS rows FROM products;

-- 2. Inventory. Aggregate order lines before comparing with snapshot stock.
DROP VIEW IF EXISTS temp.product_metrics;
CREATE TEMP VIEW product_metrics AS
SELECT p.productCode, p.productName, p.productLine, p.quantityInStock,
       COALESCE(SUM(d.quantityOrdered), 0) AS units_ordered,
       1.0 * COALESCE(SUM(d.quantityOrdered), 0) / NULLIF(p.quantityInStock, 0) AS stock_ratio,
       COALESCE(SUM(d.quantityOrdered * d.priceEach), 0) AS revenue
FROM products AS p
LEFT JOIN orderdetails AS d ON d.productCode = p.productCode
GROUP BY p.productCode, p.productName, p.productLine, p.quantityInStock;

-- First shortlist the ten highest demand-to-stock ratios, then rank by sales.
WITH shortlist AS (
    SELECT * FROM product_metrics
    ORDER BY stock_ratio DESC, productCode LIMIT 10
)
SELECT productName, quantityInStock, units_ordered, ROUND(stock_ratio, 2) AS demand_to_stock,
       ROUND(revenue, 2) AS ordered_sales
FROM shortlist ORDER BY revenue DESC, productCode;

-- Review low-demand products before placing another purchase order.
SELECT productName, quantityInStock, units_ordered, ROUND(stock_ratio, 3) AS demand_to_stock
FROM product_metrics WHERE quantityInStock > 0
ORDER BY stock_ratio, productCode LIMIT 5;

-- 3. Customer marketing. Gross profit uses the recorded product buy price.
DROP VIEW IF EXISTS temp.customer_profit;
CREATE TEMP VIEW customer_profit AS
SELECT c.customerNumber, c.customerName, c.contactFirstName, c.contactLastName, c.city, c.country,
       SUM(d.quantityOrdered * (d.priceEach - p.buyPrice)) AS gross_profit
FROM customers AS c
JOIN orders AS o ON o.customerNumber = c.customerNumber
JOIN orderdetails AS d ON d.orderNumber = o.orderNumber
JOIN products AS p ON p.productCode = d.productCode
GROUP BY c.customerNumber, c.customerName, c.contactFirstName, c.contactLastName, c.city, c.country;

WITH ranked AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY gross_profit DESC, customerNumber) AS high_rank,
              ROW_NUMBER() OVER (ORDER BY gross_profit, customerNumber) AS low_rank
    FROM customer_profit
)
SELECT CASE WHEN high_rank <= 5 THEN 'VIP' ELSE 'Lower profit' END AS segment,
       customerName, contactFirstName, contactLastName, city, country, ROUND(gross_profit, 2) AS profit
FROM ranked WHERE high_rank <= 5 OR low_rank <= 5
ORDER BY high_rank;

-- 4. Acquisition benchmark. Average observed gross profit per purchasing account.
SELECT COUNT(*) AS purchasing_accounts, ROUND(AVG(gross_profit), 2) AS historical_value
FROM customer_profit;

-- Sensitivity check: include only orders explicitly marked Shipped.
WITH shipped_profit AS (
    SELECT o.customerNumber, SUM(d.quantityOrdered * (d.priceEach - p.buyPrice)) AS profit
    FROM orders AS o
    JOIN orderdetails AS d ON d.orderNumber = o.orderNumber
    JOIN products AS p ON p.productCode = d.productCode
    WHERE o.status = 'Shipped'
    GROUP BY o.customerNumber
)
SELECT COUNT(*) AS shipped_accounts, ROUND(AVG(profit), 2) AS shipped_value FROM shipped_profit;
