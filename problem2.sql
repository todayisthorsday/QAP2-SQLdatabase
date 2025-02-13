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
