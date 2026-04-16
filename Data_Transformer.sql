CREATE DATABASE dataTransformer;
USE dataTransformer;

-- Customers Table
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO customers VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', '2023-05-10'),
(2, 'Jane', 'Smith', 'jane.smith@yahoo.com', '2023-06-15'),
(3, 'Amit', 'Sharma', 'amit.sharma@gmail.com', '2023-07-20'),
(4, 'Priya', 'Patel', 'priya.patel@gmail.com', '2024-08-05'),
(5, 'Rahul', 'Verma', 'rahul.verma@gmail.com', '2024-09-12'),
(6, 'Sneha', 'Iyer', 'sneha.iyer@gmail.com', '2024-10-18'),
(7, 'Rohit', 'Mehta', 'rohit.mehta@gmail.com', '2024-11-25'),
(8, 'Anjali', 'Nair', 'anjali.nair@gmail.com', '2024-12-30'),
(9, 'Karan', 'Malhotra', 'karan.m@gmail.com', '2025-01-14'),
(10, 'Pooja', 'Kapoor', 'pooja.k@gmail.com', '2025-03-22'),
(11, 'Vikas', 'Gupta', 'vikas.g@gmail.com', '2026-02-02'),
(12, 'Neha', 'Agarwal', 'neha.a@gmail.com', '2026-02-10'),
(13, 'Arjun', 'Reddy', 'arjun.r@gmail.com', '2026-02-20'),
(14, 'Meera', 'Joshi', 'meera.j@gmail.com', '2026-03-05'),
(15, 'Sahil', 'Khan', 'sahil.k@gmail.com', '2026-03-12');


-- Orders Table
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, '2024-06-01', 150.50),
(102, 2, '2024-06-05', 200.75),
(103, 3, '2024-07-10', 320.00),
(104, 5, '2024-09-01', 500.00),
(105, 6, '2024-10-12', 600.50),
(106, 8, '2024-12-05', 800.00),
(107, 9, '2025-01-18', 900.25),
(108, 11, '2026-02-03', 1100.50),
(109, 12, '2026-02-11', 1200.75),
(110, 13, '2026-02-21', 1300.00),
(111, 14, '2026-03-06', 1400.25),
(112, 15, '2026-03-16', 1500.00),
(113, 17, '2024-08-15', 450.25),
(114, 20,'2024-11-20', 700.75);


-- Employees Table
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Mark', 'Johnson', 'Sales', '2025-01-15', 50000),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000),
(3, 'David', 'Brown', 'IT', '2022-07-11', 70000),
(4, 'Emma', 'Wilson', 'Finance', '2018-09-25', 65000),
(5, 'Daniel', 'Taylor', 'Sales', '2022-05-30', 48000),
(6, 'Olivia', 'Anderson', 'HR', '2023-02-10', 53000),
(7, 'James', 'Thomas', 'IT', '2024-11-19', 72000),
(8, 'Sophia', 'Martin', 'Finance', '2026-02-01', 60000),
(9, 'Liam', 'White', 'Sales', '2026-02-08', 52000),
(10, 'Noah', 'Harris', 'IT', '2026-02-18', 75000),
(11, 'Ava', 'Clark', 'HR', '2026-03-04', 58000),
(12, 'Mason', 'Lewis', 'Finance', '2026-03-12', 67000);

-- Retrieve all orders and customer details where orders exist.
SELECT c.CustomerID, c.FirstName, o.OrderID, o.OrderDate, o.TotalAmount 
FROM customers c 
JOIN orders o ON c.CustomerID = o.CustomerID;

-- Retrieve all customers and their corresponding orders (if any).
SELECT c.CustomerID, c.FirstName, o.OrderID, o.OrderDate, o.TotalAmount 
FROM customers c 
LEFT JOIN orders o ON c.CustomerID = o.CustomerID;

-- Retrieve all orders and their corresponding customers (if any).
SELECT c.CustomerID, c.FirstName, o.OrderID, o.OrderDate, o.TotalAmount 
FROM customers c 
RIGHT JOIN orders o ON c.CustomerID = o.CustomerID;

-- Retrieve all customers and all orders, regardless of matching.
SELECT c.CustomerID, c.FirstName, o.OrderID, o.OrderDate, o.TotalAmount 
FROM customers c 
LEFT JOIN orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, o.OrderID, o.OrderDate, o.TotalAmount 
FROM customers c 
RIGHT JOIN orders o ON c.CustomerID = o.CustomerID;

-- Find customers who have placed orders worth more than the average amount.
SELECT CustomerID, OrderID, TotalAmount FROM orders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM orders);

-- Find employees with salaries above the average salary.
SELECT * FROM employees
WHERE Salary > (SELECT AVG(Salary) FROM employees);

-- Extract the year and month from the OrderDate.
SELECT OrderDate, MONTH(OrderDate) AS Month,
YEAR(OrderDate) AS Year FROM orders;

-- Calculate the difference in days between two dates (order date and current date).
SELECT *, DATEDIFF(CURDATE(), OrderDate) AS DaysDiff
FROM orders;

-- Format the OrderDate to a more readable format (e.g., "DD-MMM-YYYY").
SELECT *, DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormatedDate
FROM orders;

-- Concatenate FirstName and LastName to in a full name.
SELECT CustomerID, FirstName, LastName,
CONCAT(FirstName, " ", LastName) AS FullName 
FROM customers;

-- Replace part of a string (e.g., replace 'John' with 'Jonathan').
SELECT FirstName, REPLACE(FirstName, 'John', 'Jonathan')
AS UpdatedName FROM customers;

-- Convert FirstName to uppercase and LastName to lowercase.
SELECT UPPER(FirstName) AS FristName_Upper,
LOWER(LastName) AS LastName_Lower FROM customers;

-- Trim extra spaces from the Email field.
SELECT CustomerID, FirstName, LastName, 
TRIM(Email) AS Trimmed_Email FROM customers;

-- Calculate the running total of TotalAmount for each order.
SELECT *, SUM(TotalAmount) 
OVER (ORDER BY OrderDate) AS cum_amount FROM orders;

-- Rank orders based on TotalAmount using the RANK() function.
SELECT *, RANK() 
OVER (ORDER BY TotalAmount DESC) AS RankPos FROM orders;

-- Assign a discount based on TotalAmount in orders(e.g., >1000 → 10% off, >500 → 5% off).
SELECT *, CASE
    WHEN TotalAmount > 1000 THEN '10% Discount'
    WHEN TotalAmount > 500 THEN '5% Discount'
    ELSE 'No Discount'
END AS Discount FROM orders;

-- Categorize employees' salaries (e.g., High, Medium, Low).
SELECT *, CASE
    WHEN Salary > 70000 THEN 'High'
    WHEN Salary > 50000 THEN 'Medium'
    ELSE 'Low'
END AS Categories FROM employees;