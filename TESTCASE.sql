-- Insert sample data into the database with Kenyan details

-- Add countries (including Kenya and East African countries)
INSERT INTO country (country_name) VALUES 
('Kenya'), ('Uganda'), ('Tanzania'), ('Rwanda'), ('Ethiopia');

-- Add address statuses
INSERT INTO address_status (status_name, description) VALUES
('Current', 'Current active address'),
('Previous', 'Previously used address'),
('Shipping', 'Address used for shipping only'),
('Billing', 'Address used for billing only');

-- Add shipping methods with relevant Kenyan shipping options
INSERT INTO shipping_method (method_name, cost, estimated_days) VALUES
('Standard', 250.00, 5),
('Express', 500.00, 2),
('Same Day Nairobi', 750.00, 0),
('Free Economy', 0.00, 7);

-- Add order statuses
INSERT INTO order_status (status_name, description) VALUES
('Pending', 'Order placed but not yet processed'),
('Processing', 'Order is being processed'),
('Shipped', 'Order has been shipped'),
('Delivered', 'Order has been delivered'),
('Cancelled', 'Order has been cancelled');

-- Add book languages (including Swahili)
INSERT INTO book_language (language_code, language_name) VALUES
('en', 'English'),
('sw', 'Swahili'),
('fr', 'French'),
('am', 'Amharic'),
('so', 'Somali');

-- Add addresses with Kenyan locations
INSERT INTO address (street_number, street_name, city, state_province, postal_code, country_id) VALUES
('123', 'Moi Avenue', 'Nairobi', 'Nairobi County', '00100', 1),
('456', 'Kenyatta Avenue', 'Mombasa', 'Mombasa County', '80100', 1),
('789', 'Oginga Odinga Street', 'Kisumu', 'Kisumu County', '40100', 1),
('42', 'Biashara Street', 'Nakuru', 'Nakuru County', '20100', 1),
('10', 'Parliament Road', 'Eldoret', 'Uasin Gishu County', '30100', 1);

-- Add customers with Kenyan names and phone numbers
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('John', 'Kamau', 'john.kamau@example.com', '+254 712 345 678'),
('Wanjiku', 'Njoroge', 'wanjiku.njoroge@example.com', '+254 723 456 789'),
('Michael', 'Omondi', 'michael.omondi@example.com', '+254 734 567 890'),
('Amina', 'Hassan', 'amina.hassan@example.com', '+254 745 678 901'),
('David', 'Mwangi', 'david.mwangi@example.com', '+254 756 789 012');

-- Add customer addresses
INSERT INTO customer_address (customer_id, address_id, status_id, date_from) VALUES
(1, 1, 1, '2023-01-01'),
(2, 2, 1, '2023-02-15'),
(3, 3, 1, '2023-03-10'),
(4, 4, 1, '2023-04-05'),
(5, 5, 1, '2023-05-20');

-- Add publishers including Kenyan publishers
INSERT INTO publisher (publisher_name, address_id, contact_name, contact_email, contact_phone) VALUES
('East African Educational Publishers', 1, 'Sarah Kamau', 'skamau@eaep.co.ke', '+254 722 111 222'),
('Longhorn Publishers', 2, 'Robert Otieno', 'rotieno@longhorn.co.ke', '+254 722 222 333'),
('Kenya Literature Bureau', 3, 'Maria Njeri', 'mnjeri@klb.co.ke', '+254 722 333 444'),
('Moran Publishers', 4, 'James Kiprop', 'jkiprop@moran.co.ke', '+254 722 444 555'),
('Oxford University Press EA', 5, 'Emma Wambui', 'ewambui@oup.co.ke', '+254 722 555 666');

-- Add authors including Kenyan authors
INSERT INTO author (first_name, last_name, biography, date_of_birth) VALUES
('Ngugi wa', 'Thiong''o', 'Renowned Kenyan author and academic', '1938-01-05'),
('Meja', 'Mwangi', 'Award-winning Kenyan novelist', '1948-12-27'),
('Grace', 'Ogot', 'Pioneering Kenyan female writer', '1930-05-15'),
('Binyavanga', 'Wainaina', 'Kenyan author and journalist', '1971-01-18'),
('Yvonne Adhiambo', 'Owuor', 'Award-winning Kenyan writer', '1968-03-14');

-- Add books by Kenyan authors
INSERT INTO book (title, isbn, publication_date, publisher_id, language_id, page_count, price, stock_quantity, description) VALUES
('Weep Not, Child', '978-9966467507', '1964-01-28', 1, 1, 136, 950.00, 50, 'A powerful novel about the Mau Mau uprising in Kenya'),
('Kill Me Quick', '978-9966469915', '1973-06-26', 2, 1, 189, 850.00, 75, 'A novel about youth unemployment in post-independence Kenya'),
('The Promised Land', '978-9966466908', '1966-08-01', 3, 1, 208, 1100.00, 30, 'A novel about Luo migration to Tanzania'),
('One Day I Will Write About This Place', '978-9966469939', '2011-11-13', 4, 1, 272, 1200.00, 60, 'A memoir by Kenyan writer Binyavanga Wainaina'),
('Dust', '978-9966467156', '2013-11-18', 5, 1, 384, 950.00, 40, 'A novel about a murder investigation in Kenya');

-- Link books to authors
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), -- Weep Not, Child by Ngugi wa Thiong'o
(2, 2), -- Kill Me Quick by Meja Mwangi
(3, 3), -- The Promised Land by Grace Ogot
(4, 4), -- One Day I Will Write About This Place by Binyavanga Wainaina
(5, 5); -- Dust by Yvonne Adhiambo Owuor

-- Create some orders
INSERT INTO cust_order (customer_id, shipping_address_id, shipping_method_id, order_total, order_status_id) VALUES
(1, 1, 2, 1800.00, 3), -- John Kamau, Express shipping, Shipped
(2, 2, 1, 950.00, 2), -- Wanjiku Njoroge, Standard shipping, Processing
(3, 3, 3, 1200.00, 1), -- Michael Omondi, Same Day Nairobi shipping, Pending
(4, 4, 4, 850.00, 4), -- Amina Hassan, Free Economy shipping, Delivered
(5, 5, 1, 2050.00, 5); -- David Mwangi, Standard shipping, Cancelled

-- Add order items
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 950.00), -- John Kamau ordered Weep Not, Child
(1, 2, 1, 850.00), -- John Kamau also ordered Kill Me Quick
(2, 1, 1, 950.00), -- Wanjiku Njoroge ordered Weep Not, Child
(3, 4, 1, 1200.00), -- Michael Omondi ordered One Day I Will Write About This Place
(4, 2, 1, 850.00), -- Amina Hassan ordered Kill Me Quick
(5, 3, 1, 1100.00), -- David Mwangi ordered The Promised Land
(5, 5, 1, 950.00); -- David Mwangi also ordered Dust

-- Add order history
INSERT INTO order_history (order_id, status_id, status_date, notes) VALUES
(1, 1, '2025-04-01 10:30:00', 'Order placed online via M-Pesa'),
(1, 2, '2025-04-01 14:15:00', 'Payment confirmed via M-Pesa'),
(1, 3, '2025-04-02 09:45:00', 'Order shipped via G4S Express'),
(2, 1, '2025-04-03 16:20:00', 'Order placed by phone'),
(2, 2, '2025-04-04 11:10:00', 'Currently processing at Nairobi warehouse'),
(3, 1, '2025-04-05 13:40:00', 'Order placed online with M-Pesa payment'),
(4, 1, '2025-04-01 09:15:00', 'Order placed online'),
(4, 2, '2025-04-01 11:30:00', 'Processing started at Mombasa branch'),
(4, 3, '2025-04-02 15:45:00', 'Order shipped via Wells Fargo'),
(4, 4, '2025-04-05 12:10:00', 'Order delivered to customer in Nakuru'),
(5, 1, '2025-04-02 14:30:00', 'Order placed online via Airtel Money'),
(5, 5, '2025-04-03 10:20:00', 'Cancelled due to customer request');

-- Test queries

-- 1. Find all books by a specific Kenyan author
SELECT b.title, b.isbn, b.price, a.first_name, a.last_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
WHERE a.last_name = 'Thiong''o';

-- 2. Get order history for a specific Kenyan customer
SELECT co.order_id, co.order_date, co.order_total, os.status_name,
       sm.method_name AS shipping_method, b.title, ol.quantity, ol.price
FROM cust_order co
JOIN order_status os ON co.order_status_id = os.status_id
JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
WHERE co.customer_id = 1
ORDER BY co.order_date DESC;

-- 3. Get sales report: total sales by book (in Kenyan context)
SELECT b.title, SUM(ol.quantity) AS total_copies_sold, 
       SUM(ol.quantity * ol.price) AS total_revenue_ksh
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
JOIN cust_order co ON ol.order_id = co.order_id
WHERE co.order_status_id NOT IN (5) -- Exclude cancelled orders
GROUP BY b.book_id
ORDER BY total_revenue_ksh DESC;

-- 4. Find low stock books (less than 40 in stock) for restocking
SELECT b.title, b.isbn, b.stock_quantity, p.publisher_name, 
       CONCAT(a.first_name, ' ', a.last_name) AS author_name
FROM book b
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
WHERE b.stock_quantity < 40
ORDER BY b.stock_quantity ASC;

-- 5. Get customer shipping addresses in Kenya
SELECT c.first_name, c.last_name, c.email, c.phone,
       a.street_number, a.street_name, a.city, a.state_province, 
       a.postal_code, co.country_name, ast.status_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
JOIN address_status ast ON ca.status_id = ast.status_id
WHERE ast.status_name = 'Current' AND co.country_name = 'Kenya'
ORDER BY a.city, c.last_name;

-- 6. Sales by county in Kenya
SELECT a.state_province AS county, COUNT(co.order_id) AS number_of_orders, 
       SUM(co.order_total) AS total_sales_ksh
FROM cust_order co
JOIN address a ON co.shipping_address_id = a.address_id
JOIN country c ON a.country_id = c.country_id
WHERE c.country_name = 'Kenya' AND co.order_status_id != 5 -- Exclude cancelled orders
GROUP BY a.state_province
ORDER BY total_sales_ksh DESC;

-- 7. Find best-selling Swahili books (if any)
SELECT b.title, b.isbn, bl.language_name, SUM(ol.quantity) AS copies_sold
FROM book b
JOIN book_language bl ON b.language_id = bl.language_id
JOIN order_line ol ON b.book_id = ol.book_id
JOIN cust_order co ON ol.order_id = co.order_id
WHERE bl.language_code = 'sw' AND co.order_status_id != 5 -- Exclude cancelled orders
GROUP BY b.book_id
ORDER BY copies_sold DESC;

-- 8. Find customers who paid using mobile money (from order history notes)
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, c.email, c.phone
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
JOIN order_history oh ON co.order_id = oh.order_id
WHERE oh.notes LIKE '%M-Pesa%' OR oh.notes LIKE '%Airtel Money%'
ORDER BY c.last_name, c.first_name;