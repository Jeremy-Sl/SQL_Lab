# Week 5 – WideWorldImporters: Import & Exploration

## 🗓️ Week Summary

**Objective:**  
- Import the WideWorldImporters sample database  
- Understand schema structure and relationships  
- Begin querying real-world data for insights  
- Compare table sizes and types  
- Run basic SELECT and JOIN queries to get familiar with the data

---

## 🏢 Environment

**Database:** `WideWorldImporters`  
**Backup Source:** `F:\WWI\WideWorldImporters-Full.bak`  
**Data Files:** `F:\WWI\DBFiles\WideWorldImporters.mdf`, `.ldf`  
**Host:** `SOR-SQL01` (SQL Server 2022 on Windows Server 2022)

---

## 🧱 Schema Overview

**Schemas Identified:**
- `Sales`
- `Purchasing`
- `Warehouse`
- `Application`
- `Website`

**Notable Tables:**
- `Sales.Customers`
- `Sales.Orders`
- `Sales.OrderLines`
- `Warehouse.StockItems`
- `Warehouse.ColdRoomTemperatures_Archive`

---

## 📝 Initial Queries

**Query 1:** Top 5 customers  
`SELECT TOP 5 * FROM Sales.Customers;`

**Query 2:** 5 most recent orders  
`SELECT TOP 5 * FROM Sales.Orders ORDER BY OrderDate DESC;`

**Query 3:** Count rows in ColdRoomTemperatures_Archive  
`SELECT COUNT(*) AS TempReadingCount FROM Warehouse.ColdRoomTemperatures_Archive;`

**Query 4:** Join Orders to Customers  
SELECT
O.OrderID,
C.CustomerName,
O.OrderDate
FROM Sales.Orders O
JOIN Sales.Customers C ON O.CustomerID = C.CustomerID
ORDER BY O.OrderDate DESC;

yaml
Copy
Edit

---

## 🔍 Observations

- Customer data includes billing relationships, categories, and geography  
- Orders are timestamped and linked to customers, with status fields  
- Cold room sensor archive contains over 3 million rows (ideal for performance testing)  
- Joins between `Sales.Orders` and `Sales.Customers` confirm relational integrity  
- No `ORDER BY` on a `TOP` query leads to non-deterministic row selection  

---

## 📸 Screenshots

- `WWI_ObjectExplorer.png` – showing table structure  
- `Query_Results_Customers.png`  
- `Query_Results_Orders.png`  
- `TempReadingCount.png`  
- `Orders_Customers_Join.png`  

---

## 📝 Notes & Reflections

This week introduced a large, realistic database structure with multiple schemas and millions of rows. The process of importing from a `.bak` file and storing the data on a dedicated disk (F:) mimics a production scenario.

Initial queries confirmed:
- Relational structure and foreign key use
- Data types are realistic and diverse
- Schema design aligns with business domains (Sales, Warehouse, etc.)

I began mapping relationships between core tables and validating data quality through sampling and counting. I’m now comfortable navigating a production-scale schema and preparing to perform analytical joins and aggregations in Week 6.

---

## 🔗 Files in this Folder

- `Week5_Exploration.md`  
- `Week5_initial_queries.sql`  
- `Screenshots/`
