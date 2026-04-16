# 🗄️ Data Transformer

> A structured MySQL project demonstrating real-world SQL techniques across three relational tables — built for learners and developers looking to sharpen their database querying skills.

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-F29111?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge)

---

## 📌 Overview

**DataTransformer** is a hands-on MySQL project built around three interrelated tables — `customers`, `orders`, and `employees`. It covers a wide range of SQL operations from fundamental JOINs to advanced window functions, making it an ideal reference for SQL learning, interviews, or portfolio demonstration.

---

## 🗂️ Database Schema

### `customers`
| Column | Type | Description |
|---|---|---|
| `CustomerID` | INT (PK) | Unique customer identifier |
| `FirstName` | VARCHAR(50) | Customer's first name |
| `LastName` | VARCHAR(50) | Customer's last name |
| `Email` | VARCHAR(100) | Email address |
| `RegistrationDate` | DATE | Date of account registration |

### `orders`
| Column | Type | Description |
|---|---|---|
| `OrderID` | INT (PK) | Unique order identifier |
| `CustomerID` | INT (FK) | References `customers.CustomerID` |
| `OrderDate` | DATE | Date the order was placed |
| `TotalAmount` | DECIMAL(10,2) | Total monetary value of the order |

### `employees`
| Column | Type | Description |
|---|---|---|
| `EmployeeID` | INT (PK) | Unique employee identifier |
| `FirstName` | VARCHAR(50) | Employee's first name |
| `LastName` | VARCHAR(50) | Employee's last name |
| `Department` | VARCHAR(50) | Department name |
| `HireDate` | DATE | Date of employment |
| `Salary` | DECIMAL(10,2) | Employee monthly salary |

---

## 📊 Sample Data

### Customers Table
![Customers Table](Customers_Table.png)

### Employees Table
![Employees Table](Employees_Table.png)

### Orders Table
![Orders Table](Orders_Table.png)

---

## ✅ SQL Concepts Covered

| # | Concept | Description |
|---|---|---|
| 1 | **INNER JOIN** | Retrieve only matching records across tables |
| 2 | **LEFT JOIN** | All customers with their orders, including those without |
| 3 | **RIGHT JOIN** | All orders with their corresponding customer details |
| 4 | **FULL OUTER JOIN** | Complete union of both tables regardless of match |
| 5 | **Subqueries** | Nested SELECT statements for comparative filtering |
| 6 | **Date Functions** | `MONTH()`, `YEAR()`, `DATEDIFF()`, `DATE_FORMAT()` |
| 7 | **String Functions** | `CONCAT()`, `REPLACE()`, `UPPER()`, `LOWER()`, `TRIM()` |
| 8 | **Window Functions** | Running totals and ranking using `SUM() OVER()` and `RANK() OVER()` |
| 9 | **CASE Statements** | Conditional logic for discount tiers and salary categorization |

---

## 🚀 Getting Started

### Prerequisites
- MySQL **8.0** or higher
- A MySQL client — [MySQL Workbench](https://www.mysql.com/products/workbench/), DBeaver, or CLI

### Installation

**Option 1 — via Terminal:**
```bash
mysql -u your_username -p < Data_Transformer.sql
```

**Option 2 — via MySQL Workbench / IDE:**
Open `Data_Transformer.sql` and execute the full script.

**Verify setup:**
```bash
USE dataTransformer;
SHOW TABLES;
-- Expected output: customers, employees, orders
```

---

## 📁 Project Structure

```
data-transformer/
│
├── Data_Transformer.sql      # Complete SQL script — DDL, DML & queries
├── Customers_Table.png       # Output screenshot: customers table
├── Employees_Table.png       # Output screenshot: employees table
├── Orders_Table.png          # Output screenshot: orders table
└── README.md                 # Project documentation
```

---

## 👤 Author

Crafted with precision for SQL learners and developers.  
Feel free to fork, extend, or use this as a portfolio reference.

---

*© 2026 DataTransformer. Built with MySQL.*
