-- QAP 2 - SQL and PostgreSQL Mastery

/* Problem 2: Online Store Inventory and Orders System 
Scenario 
You are developing a system to manage products, customers, and their orders in an online store. */

-- Create tables
-- Products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
)

-- Customers Table
CREATE TABLE customers (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
)

-- Orders Table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
)

-- Order Items Table
CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
)

-- Insert data into tables
-- Products data (5)
INSERT INTO products (product_name, price, stock_quantity)
VALUES  ('Unicorn Flavored Toothpaste', 5.99, 150),
        ('Inflatable Toaster', 19.99, 25),
        ('Invisible Ink Pen', 2.50, 200),
        ('Cheese Scented Candle', 12.99, 75),
        ('Pet Rock with Wi-Fi', 29.99, 50);

-- Customers data (4)
INSERT INTO customers (id, first_name, last_name, email)
VALUES  (1, 'Jack', 'Torrence', 'jack@theoverlook.com'),
        (2, 'Carrie', 'White', 'White.C@ewanhigh.edu'),
        (3, 'Paul', 'Shelton', 'paul@miserydies.com'),
        (4, 'Roland', 'Deschain', 'roland@thegunslingerofGilead')

-- Orders data (5)
-- (each order should have at least two items ordered)
-- Insert data into orders table
INSERT INTO orders (id, customer_id, order_date)
VALUES
    (1, 1, '2025-02-10'),
    (2, 2, '2025-02-11'),
    (3, 3, '2025-02-12'),
    (4, 4, '2025-02-13'),
    (5, 1, '2025-02-14');

-- Insert data into order_items table 
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
    -- Order 1 (Jack Torrence)
    (1, 1, 2),  
    (1, 3, 1), 
    -- Order 2 (Carrie White)
    (2, 4, 3),  
    (2, 2, 1),  
    -- Order 3 (Paul Shelton)
    (3, 5, 2),  
    (3, 1, 5),  
    -- Order 4 (Roland Deschain)
    (4, 2, 1),  
    (4, 3, 3), 
    -- Order 5 (Jack Torrence)
    (5, 4, 2),  
    (5, 5, 1);  

-- Queries
-- Query 1: Retrieve the names and stock quantities of all products.
SELECT product_name, stock_quantity
FROM products;

-- Query 2: Retrieve the product names and quantities for one of the orders placed.
SELECT products.product_name, order_items.quantity
FROM products
JOIN order_items ON products.id = order_items.product_id
WHERE order_items.order_id = 1;

-- Query 3: Retrieve all orders placed by a specific customer (including the ID’s of what was ordered and the quantities).
SELECT orders.id, products.id, products.product_name, order_items.quantity
FROM orders
JOIN order_items ON orders.id = order_items.order_id
WHERE orders.customer_id = 1;

-- Update data
-- Add an order
INSERT INTO orders (id, customer_id, order_date)
VALUES (6, 4, '2025-02-15');
-- Add items to order
INSERT INTO order_items (order_id, product_id, quantity)
VALUES (6, 1, 3);
-- Update stock quantity
UPDATE products
SET stock_quantity = stock_quantity - 3
WHERE id = 3;

-- Delete data
-- Remove items from the order
DELETE FROM order_items
WHERE order_id = 5;
-- Remove the order
DELETE FROM orders
WHERE id = 5;
