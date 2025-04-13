-- Example Queries for Bookstore Database
-- Demonstrates various business use cases

-- 1. Inventory Management Queries

-- Low stock alert
SELECT b.book_id, b.title, b.stock_quantity, p.publisher_name
FROM book b
JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE b.stock_quantity < 5
ORDER BY b.stock_quantity ASC;

-- Books by language
SELECT l.language_name, COUNT(b.book_id) AS book_count
FROM book b
JOIN book_language l ON b.language_id = l.language_id
GROUP BY l.language_name
ORDER BY book_count DESC;

-- 2. Customer and Order Queries

-- Customer order history
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(ol.quantity * ol.price) AS total_spent
FROM customer c
LEFT JOIN cust_order o ON c.customer_id = o.customer_id
LEFT JOIN order_line ol ON o.order_id = ol.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- Current order status
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    o.order_date,
    os.status_value AS current_status,
    MAX(oh.status_date) AS last_update
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_history oh ON o.order_id = oh.order_id
JOIN order_status os ON oh.status_id = os.status_id
WHERE oh.status_date = (
    SELECT MAX(status_date) 
    FROM order_history 
    WHERE order_id = o.order_id
)
GROUP BY o.order_id;

-- 3. Sales Analysis Queries

-- Top selling books
SELECT 
    b.book_id,
    b.title,
    a.author_name,
    SUM(ol.quantity) AS total_sold,
    SUM(ol.quantity * ol.price) AS total_revenue
FROM book b
JOIN order_line ol ON b.book_id = ol.book_id
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
GROUP BY b.book_id
ORDER BY total_sold DESC
LIMIT 10;

-- Monthly sales report
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS order_count,
    SUM(ol.quantity) AS items_sold,
    SUM(ol.quantity * ol.price) AS gross_revenue,
    SUM(sm.cost) AS shipping_revenue,
    SUM(ol.quantity * ol.price + sm.cost) AS total_revenue
FROM cust_order o
JOIN order_line ol ON o.order_id = ol.order_id
JOIN shipping_method sm ON o.method_id = sm.method_id
GROUP BY month
ORDER BY month;

-- 4. Author Performance
SELECT 
    a.author_id,
    a.author_name,
    COUNT(DISTINCT ba.book_id) AS books_written,
    SUM(ol.quantity) AS copies_sold,
    SUM(ol.quantity * ol.price) AS revenue_generated
FROM author a
LEFT JOIN book_author ba ON a.author_id = ba.author_id
LEFT JOIN order_line ol ON ba.book_id = ol.book_id
GROUP BY a.author_id
ORDER BY revenue_generated DESC;

-- 5. Shipping Analysis
SELECT 
    sm.method_name,
    COUNT(o.order_id) AS order_count,
    AVG(DATEDIFF(
        (SELECT MAX(status_date) FROM order_history oh 
         WHERE oh.order_id = o.order_id AND oh.status_id = 
            (SELECT status_id FROM order_status WHERE status_value = 'Delivered')),
        o.order_date
    )) AS avg_delivery_days
FROM shipping_method sm
LEFT JOIN cust_order o ON sm.method_id = o.method_id
LEFT JOIN order_history oh ON o.order_id = oh.order_id
WHERE oh.status_id = (SELECT status_id FROM order_status WHERE status_value = 'Delivered')
GROUP BY sm.method_id;