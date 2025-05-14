-- Week 5 - WideWorldImporters Initial Exploration Queries
-- Author: [Your Name]
-- Date: [Insert Date]
-- Target Database: WideWorldImporters

USE WideWorldImporters;
GO

-- 1. Preview top 5 customers
SELECT TOP 5 *
FROM Sales.Customers;
GO

-- 2. Preview 5 most recent orders
SELECT TOP 5 *
FROM Sales.Orders
ORDER BY OrderDate DESC;
GO

-- 3. Count number of sensor readings in the archive
SELECT COUNT(*) AS TempReadingCount
FROM Warehouse.ColdRoomTemperatures_Archive;
GO

-- 4. Join Orders to Customers and view order info
SELECT 
    O.OrderID,
    C.CustomerName,
    O.OrderDate
FROM Sales.Orders O
JOIN Sales.Customers C ON O.CustomerID = C.CustomerID
ORDER BY O.OrderDate DESC;
GO

-- 5. Check number of rows in a few key tables
SELECT 'Customers' AS TableName, COUNT(*) AS RowCount FROM Sales.Customers
UNION ALL
SELECT 'Orders', COUNT(*) FROM Sales.Orders
UNION ALL
SELECT 'OrderLines', COUNT(*) FROM Sales.OrderLines
UNION ALL
SELECT 'StockItems', COUNT(*) FROM Warehouse.StockItems;
GO

-- 6. Identify schemas present in the database
SELECT DISTINCT TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA;
GO

-- 7. View table relationships using sys.foreign_keys
SELECT 
    OBJECT_NAME(f.parent_object_id) AS ParentTable,
    OBJECT_NAME(f.referenced_object_id) AS ReferencedTable
FROM sys.foreign_keys f
ORDER BY ParentTable;
GO
