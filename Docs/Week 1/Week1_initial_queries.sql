-- Week 1 - Initial SQL Queries

-- Query SQL Server version
SELECT @@VERSION;

-- List all databases and their recovery models
SELECT name, recovery_model_desc 
FROM sys.databases;

-- View CPU count and available memory in MB
SELECT cpu_count, physical_memory_kb / 1024 AS Memory_MB 
FROM sys.dm_os_sys_info;

-- Create a new database
CREATE DATABASE TestDB;

-- Switch to the new database
USE TestDB;

-- Create the HelloWorld table
CREATE TABLE HelloWorld (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Message NVARCHAR(50)
);

-- Insert a test record into the HelloWorld table
INSERT INTO HelloWorld (Message) 
VALUES ('Hello, SQL Server!');

-- Query the HelloWorld table to view inserted data
SELECT * FROM HelloWorld;
