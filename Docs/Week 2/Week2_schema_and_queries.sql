-- Week 2 - Schema and Queries
-- InventoryDB schema creation, data insertion, and join queries

-- Create the InventoryDB database
CREATE DATABASE InventoryDB;
GO

-- Use the new database
USE InventoryDB;
GO

-- Create the Servers table
CREATE TABLE Servers (
    ServerID INT IDENTITY(1,1) PRIMARY KEY,
    Hostname NVARCHAR(100) NOT NULL,
    OS NVARCHAR(50),
    InstalledDate DATE
);
GO

-- Create the MaintenanceRecords table
CREATE TABLE MaintenanceRecords (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    ServerID INT,
    MaintenanceDate DATE,
    PerformedBy NVARCHAR(50),
    Notes NVARCHAR(255),
    CONSTRAINT FK_Server
        FOREIGN KEY (ServerID)
        REFERENCES Servers(ServerID)
);
GO

-- Insert sample data into Servers
INSERT INTO Servers (Hostname, OS, InstalledDate)
VALUES 
('SQL-SVR01', 'Windows Server 2022', '2023-01-15'),
('WEB-SVR01', 'Windows Server 2019', '2022-08-10'),
('APP-SVR01', 'Ubuntu 22.04', '2023-03-05');
GO

-- Insert sample data into MaintenanceRecords
INSERT INTO MaintenanceRecords (ServerID, MaintenanceDate, PerformedBy, Notes)
VALUES 
(1, '2023-07-01', 'AdminA', 'Monthly patching'),
(1, '2024-01-15', 'AdminB', 'Disk cleanup'),
(2, '2023-09-20', 'AdminA', 'OS update');
GO

-- Select all data from Servers
SELECT * FROM Servers;
GO

-- Select all data from MaintenanceRecords
SELECT * FROM MaintenanceRecords;
GO

-- LEFT JOIN: Show all servers and their latest maintenance date
SELECT 
    S.Hostname,
    MAX(M.MaintenanceDate) AS LastMaintenance
FROM 
    Servers S
LEFT JOIN 
    MaintenanceRecords M ON S.ServerID = M.ServerID
GROUP BY 
    S.Hostname;
GO

-- INNER JOIN: Show only servers that have maintenance records
SELECT 
    S.Hostname,
    M.MaintenanceDate
FROM 
    Servers S
INNER JOIN 
    MaintenanceRecords M ON S.ServerID = M.ServerID;
GO

-- LEFT JOIN + NULL filter: Show servers with NO maintenance records
SELECT 
    S.Hostname,
    M.MaintenanceDate AS LastMaintenance
FROM 
    Servers S
LEFT JOIN 
    MaintenanceRecords M ON S.ServerID = M.ServerID
WHERE 
    M.MaintenanceDate IS NULL;
GO

