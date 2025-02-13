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