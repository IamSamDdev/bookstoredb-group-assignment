-- User Management for Bookstore Database
-- Creates users with appropriate permissions

-- 1. Admin User (Full access)
CREATE USER IF NOT EXISTS 'bookstore_admin'@'localhost' IDENTIFIED BY 'Admin@1234';
GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore_admin'@'localhost';
GRANT GRANT OPTION ON bookstore.* TO 'bookstore_admin'@'localhost';

-- 2. Inventory Manager (Manage books and stock)
CREATE USER IF NOT EXISTS 'bookstore_inventory'@'localhost' IDENTIFIED BY 'Inv@5678';
GRANT SELECT, INSERT, UPDATE ON bookstore.book TO 'bookstore_inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.book_author TO 'bookstore_inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.author TO 'bookstore_inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.publisher TO 'bookstore_inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.book_language TO 'bookstore_inventory'@'localhost';

-- 3. Customer Service (Manage customers and orders)
CREATE USER IF NOT EXISTS 'bookstore_service'@'localhost' IDENTIFIED BY 'Service@9012';
GRANT SELECT, INSERT, UPDATE ON bookstore.customer TO 'bookstore_service'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.address TO 'bookstore_service'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.customer_address TO 'bookstore_service'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'bookstore_service'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'bookstore_service'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'bookstore_service'@'localhost';

-- 4. Reporting User (Read-only access)
CREATE USER IF NOT EXISTS 'bookstore_report'@'localhost' IDENTIFIED BY 'Report@3456';
GRANT SELECT ON bookstore.* TO 'bookstore_report'@'localhost';

-- 5. Application User (Standard operations)
CREATE USER IF NOT EXISTS 'bookstore_app'@'localhost' IDENTIFIED BY 'App@7890';
GRANT SELECT, INSERT, UPDATE ON bookstore.* TO 'bookstore_app'@'localhost';
GRANT DELETE ON bookstore.order_history TO 'bookstore_app'@'localhost';
GRANT DELETE ON bookstore.order_line TO 'bookstore_app'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;