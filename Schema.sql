-- ===========================================================
-- Online Bookstore SQL Project
-- Database Schema (schema.sql)
-- ===========================================================

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Books;

-- ===========================================================
-- Create Tables
-- ===========================================================

-- ==========================
-- 1. Books Table
-- ==========================
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,              -- Unique book identifier
    Title VARCHAR(100) NOT NULL,             -- Book title
    Author VARCHAR(100) NOT NULL,            -- Author name
    Genre VARCHAR(50) NOT NULL,              -- Fiction, Fantasy, Thriller etc.
    Published_Year INT,                      -- Year of publication
    Price NUMERIC(10,2) NOT NULL,            -- Book price
    Stock INT DEFAULT 0                      -- Inventory count
);

-- ==========================
-- 2. Customers Table
-- ==========================
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,          -- Unique customer ID
    Name VARCHAR(100) NOT NULL,              -- Customer full name
    Email VARCHAR(100),                      -- Email address
    Phone VARCHAR(20),                       -- Contact number
    City VARCHAR(50),                        -- City of customer
    Country VARCHAR(150)                     -- Country of customer
);

-- ==========================
-- 3. Orders Table
-- ==========================
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,             -- Unique order ID
    Customer_ID INT REFERENCES Customers(Customer_ID),  -- Foreign key to customers
    Book_ID INT REFERENCES Books(Book_ID),             -- Foreign key to books
    Order_Date DATE NOT NULL,                -- When order was placed
    Quantity INT NOT NULL,                   -- Number of books ordered
    Total_Amount NUMERIC(10,2) NOT NULL      -- Price * Quantity
);
