-- Week 4 - Indexing & Performance Tuning
-- Author: [Your Name]
-- Database: InventoryDB

USE InventoryDB;
GO

-- Step 1: Enable statistics and run baseline query
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

-- Baseline query (before indexes)
SELECT S.Hostname, COUNT(M.RecordID)
FROM Servers S
LEFT JOIN MaintenanceRecords M ON S.ServerID = M.ServerID
GROUP BY S.Hostname;
GO

-- Disable statistics output after baseline
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- Step 2: Create non-clustered index on MaintenanceRecords.ServerID
CREATE NONCLUSTERED INDEX IX_Maintenance_ServerID
ON MaintenanceRecords (ServerID);
GO

-- Step 3 (optional): Create composite index on ServerID, MaintenanceDate
-- Recommended only if you run performance queries with date filtering
-- CREATE NONCLUSTERED INDEX IX_Maintenance_ServerDate
-- ON MaintenanceRecords (ServerID, MaintenanceDate);
-- GO

-- Step 4: Re-run query after indexing to measure improvement
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT S.Hostname, COUNT(M.RecordID)
FROM Servers S
LEFT JOIN MaintenanceRecords M ON S.ServerID = M.ServerID
GROUP BY S.Hostname;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
