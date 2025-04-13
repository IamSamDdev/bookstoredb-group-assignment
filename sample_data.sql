-- Sample Data for Bookstore Database
-- Inserting data in proper dependency order

-- 1. Book Languages
INSERT INTO book_language (language_code, language_name) VALUES 
('EN', 'English'),
('FR', 'French'),
('ES', 'Spanish'),
('DE', 'German'),
('JA', 'Japanese');

-- 2. Publishers
INSERT INTO publisher (publisher_name, established_year, headquarters) VALUES 
('Penguin Random House', 2013, 'New York City, USA'),
('HarperCollins', 1817, 'New York City, USA'),
('Macmillan', 1843, 'London, UK'),
('Hachette', 1826, 'Paris, France'),
('Simon & Schuster', 1924, 'New York City, USA');

-- 3. Authors
INSERT INTO author (author_name, birth_date, nationality) VALUES 
('J.K. Rowling', '1965-07-31', 'British'),
('George R.R. Martin', '1948-09-20', 'American'),
('Stephen King', '1947-09-21', 'American'),
('Haruki Murakami', '1949-01-12', 'Japanese'),
('Agatha Christie', '1890-09-15', 'British');

-- 4. Books
INSERT INTO book (title, isbn, num_pages, publication_date, language_id, publisher_id, price, stock_quantity, description) VALUES 
('Harry Potter and the Philosopher''s Stone', '9780747532743', 223, '1997-06-26', 1, 1, 12.99, 50, 'The first book in the Harry Potter series'),
('A Game of Thrones', '9780553103540', 694, '1996-08-01', 1, 2, 15.99, 30, 'The first book in A Song of Ice and Fire series'),
('The Shining', '9780385121675', 447, '1977-01-28', 1, 3, 9.99, 25, 'A classic horror novel'),
('Norwegian Wood', '9780099448822', 296, '1987-09-04', 5, 4, 11.50, 20, 'A romantic novel set in 1960s Tokyo'),
('Murder on the Orient Express', '9780007119318', 256, '1934-01-01', 1, 5, 8.99, 40, 'A Hercule Poirot mystery');

-- 5. Book-Author Relationships
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- 6. Countries
INSERT INTO country (country_name, country_code) VALUES 
('United States', 'USA'),
('United Kingdom', 'GBR'),
('France', 'FRA'),
('Japan', 'JPN'),
('Germany', 'DEU');

-- 7. Address Statuses
INSERT INTO address_status (address_status, description) VALUES 
('Active', 'Currently in use'),
('Inactive', 'No longer in use'),
('Pending', 'Awaiting verification'),
('Temporary', 'Short-term use only');

-- 8. Addresses
INSERT INTO address (street_number, street_name, apartment_number, city, state_province, country_id, postal_code) VALUES 
('123', 'Main Street', 'Apt 4B', 'New York', 'NY', 1, '10001'),
('456', 'Oak Avenue', NULL, 'London', NULL, 2, 'SW1A 1AA'),
('789', 'Rue de Rivoli', '3rd Floor', 'Paris', 'Île-de-France', 3, '75001'),
('10', 'Sakura Lane', NULL, 'Tokyo', 'Kanto', 4, '100-0001'),
('321', 'Elm Street', NULL, 'Chicago', 'IL', 1, '60601');

-- 9. Customers
INSERT INTO customer (first_name, last_name, email, phone) VALUES 
('John', 'Doe', 'john.doe@example.com', '555-0101'),
('Jane', 'Smith', 'jane.smith@example.com', '555-0102'),
('Robert', 'Johnson', 'robert.j@example.com', '555-0103'),
('Emily', 'Davis', 'emily.d@example.com', '555-0104'),
('Michael', 'Brown', 'michael.b@example.com', '555-0105');

-- 10. Customer Addresses
INSERT INTO customer_address (customer_id, address_id, status_id, is_default) VALUES 
(1, 1, 1, TRUE),
(2, 2, 1, TRUE),
(3, 3, 1, TRUE),
(4, 4, 1, TRUE),
(5, 5, 1, TRUE);

-- 11. Order Statuses
INSERT INTO order_status (status_value, description) VALUES 
('Pending', 'Order received but not processed'),
('Processing', 'Order is being prepared for shipment'),
('Shipped', 'Order has been shipped'),
('Delivered', 'Order has been delivered'),
('Cancelled', 'Order was cancelled');

-- 12. Shipping Methods
INSERT INTO shipping_method (method_name, cost, delivery_time_days) VALUES 
('Standard', 4.99, 5),
('Express', 9.99, 2),
('Overnight', 19.99, 1),
('International', 14.99, 7);

-- 13. Customer Orders
INSERT INTO cust_order (customer_id, shipping_address_id, method_id, order_notes) VALUES 
(1, 1, 1, 'Gift wrapping requested'),
(2, 2, 3, 'Leave at front door'),
(3, 3, 2, 'Business address'),
(4, 4, 4, 'International delivery'),
(5, 5, 1, NULL);

-- 14. Order Lines
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES 
(1, 1, 2, 12.99),
(1, 3, 1, 9.99),
(2, 2, 1, 15.99),
(3, 4, 3, 11.50),
(4, 5, 1, 8.99),
(5, 1, 1, 12.99);

-- 15. Order History
INSERT INTO order_history (order_id, status_id, notes) VALUES 
(1, 1, 'Order received'),
(1, 2, 'Processing started'),
(2, 1, 'Order received'),
(3, 1, 'Order received'),
(4, 1, 'Order received'),
(5, 1, 'Order received'),
(1, 3, 'Shipped via USPS'),
(2, 3, 'Shipped via FedEx');