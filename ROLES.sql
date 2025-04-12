
-- Administrator role with full access
CREATE ROLE 'bookstore_admin';
GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore_admin';

-- Sales staff role - can view all data and modify orders
CREATE ROLE 'bookstore_sales';
GRANT SELECT ON bookstore.* TO 'bookstore_sales';
GRANT INSERT, UPDATE, DELETE ON bookstore.cust_order TO 'bookstore_sales';
GRANT INSERT, UPDATE, DELETE ON bookstore.order_line TO 'bookstore_sales';
GRANT INSERT, UPDATE, DELETE ON bookstore.order_history TO 'bookstore_sales';
GRANT INSERT, UPDATE, DELETE ON bookstore.customer TO 'bookstore_sales';
GRANT INSERT, UPDATE, DELETE ON bookstore.customer_address TO 'bookstore_sales';

-- Inventory manager role - can view all data and modify book inventory
CREATE ROLE 'bookstore_inventory';
GRANT SELECT ON bookstore.* TO 'bookstore_inventory';
GRANT INSERT, UPDATE, DELETE ON bookstore.book TO 'bookstore_inventory';
GRANT INSERT, UPDATE, DELETE ON bookstore.author TO 'bookstore_inventory';
GRANT INSERT, UPDATE, DELETE ON bookstore.book_author TO 'bookstore_inventory';
GRANT INSERT, UPDATE, DELETE ON bookstore.publisher TO 'bookstore_inventory';

-- Read-only analyst role
CREATE ROLE 'bookstore_analyst';
GRANT SELECT ON bookstore.* TO 'bookstore_analyst';

-- Create sample users and assign roles
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'secure_admin_password';
GRANT 'bookstore_admin' TO 'admin_user'@'localhost';

CREATE USER 'sales_user'@'localhost' IDENTIFIED BY 'secure_sales_password';
GRANT 'bookstore_sales' TO 'sales_user'@'localhost';

CREATE USER 'inventory_user'@'localhost' IDENTIFIED BY 'secure_inventory_password';
GRANT 'bookstore_inventory' TO 'inventory_user'@'localhost';

CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'secure_analyst_password';
GRANT 'bookstore_analyst' TO 'analyst_user'@'localhost';

-- Apply the granted roles
SET DEFAULT ROLE ALL TO
  'admin_user'@'localhost',
  'sales_user'@'localhost',
  'inventory_user'@'localhost',
  'analyst_user'@'localhost';